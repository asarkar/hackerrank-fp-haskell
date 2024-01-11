module Introduction.HelloWorldN where

import qualified Control.Monad as M

main :: IO ()
main = do
  n <- readLn :: IO Int
  M.replicateM_ n $ putStrLn "Hello World"
