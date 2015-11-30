module OpenCog.Lib where

import OpenCog.AtomSpace
import Foreign.C
import Foreign.Ptr

foreign export ccall "someFunc"
    c_func :: Ptr AtomSpaceRef -> UUID -> IO (UUID)

c_func = exportFunction someFunc

someFunc :: AtomGen -> AtomSpace AtomGen
someFunc a = return (Gen $ SetLink [a,a])
