import numpy as np
import tifffile as tff


class CellDIVE_IO:
    def __init__(self):
        self.img = None

    def ReadPTiffLevel(self, tiffName, level=None):

        tif = tff.TiffFile(tiffName)

        self.img = []
        id1 = 0
        id2 = len(tif.pages)
        if level is not None:
            # a range is specified
            id1 = level[0]
            id2 = level[-1]

        for i in range(id1, id2+1):
            self.img.append(tif.pages[i].asarray())

        return self.img

    def CreateBigTiffFromTIssueMask(self, mask, targetFN):

        tif = tff.TiffFile(targetFN)

        LP =  tif.pages[-1].asarray()

        if LP.shape[0] != mask.shape[0] or LP.shape[1] != mask.shape[1]:
            print('Error: size mismatch')
            return None

        L = len(tif.pages) - 2

        out = [mask]
        import cv2
        tmp = mask
        for i in range(L,-1,-1):
            CP = tif.pages[i].asarray()
            tmp = cv2.resize(tmp,(CP.shape[1],CP.shape[0]),interpolation=cv2.INTER_NEAREST)
            out.append(tmp)

        return out

    def WritePTIff(self, img, tiffName, revOrder=False):

        with tff.TiffWriter(tiffName, bigtiff=True) as tif:
            if revOrder is True:
                for i in range(len(img)):
                    tif.save(img.pop(), compress=6, photometric='minisblack')
            else:
                for i in range(len(img)):
                    tif.save(img[i], compress=6, photometric='minisblack')

            tif.close()