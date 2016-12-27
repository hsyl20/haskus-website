{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.List (isPrefixOf)
import Data.Text (pack, unpack, replace, empty)
import System.FilePath.Posix

import Hakyll

main :: IO ()
main = hakyll $ do
    -- Compress CSS
    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    -- Copy Files
    match "files/**/*" $ do
        route   idRoute
        compile copyFileCompiler

    -- Copy Files
    match "files/*" $ do
        route   idRoute
        compile copyFileCompiler
    
    -- Copy Images
    match "images/**" $ do
        route   idRoute
        compile copyFileCompiler

    -- home
    match "pages/home.md" $ do
        route $ customRoute $ const "index.html"
        compile $ pandocCompiler
             >>= loadAndApplyTemplate "templates/page.html" defaultContext
             >>= loadAndApplyTemplate "templates/default.html" defaultContext
             >>= relativizeUrls
    
    -- Static pages
    match "pages/**" $ do
        let
          makeRoute p = dirs </> fname </> "index.html"
            where
               -- drop /pages and the filename
               dirs = joinPath $ tail $ init $ splitPath $ toFilePath p
               fname = takeBaseName $ toFilePath p
        route $ customRoute makeRoute
        compile $ pandocCompiler
           >>= loadAndApplyTemplate "templates/page.html" defaultContext
           >>= loadAndApplyTemplate "templates/default.html"  defaultContext
           >>= relativizeUrls

    -- Read templates
    match "templates/*" $ compile templateCompiler

externalizeUrls :: String -> Item String -> Compiler (Item String)
externalizeUrls root item = return $ fmap (externalizeUrlsWith root) item

externalizeUrlsWith :: String -- ^ Path to the site root
                    -> String -- ^ HTML to externalize
                    -> String -- ^ Resulting HTML
externalizeUrlsWith root = withUrls ext
  where
    ext x = if isExternal x then x else root ++ x

-- TODO: clean me
unExternalizeUrls :: String -> Item String -> Compiler (Item String)
unExternalizeUrls root item = return $ fmap (unExternalizeUrlsWith root) item

unExternalizeUrlsWith :: String -- ^ Path to the site root
                      -> String -- ^ HTML to unExternalize
                      -> String -- ^ Resulting HTML
unExternalizeUrlsWith root = withUrls unExt
  where
    unExt x = if root `isPrefixOf` x then unpack $ replace (pack root) empty (pack x) else x
