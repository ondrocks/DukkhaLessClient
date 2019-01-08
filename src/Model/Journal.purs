module Model.Journal where

import Prelude

import Data.Argonaut.Decode.Combinators ((.?))
import Data.Argonaut.Encode.Combinators ((~>), (:=))
import Data.Crypto.Class (class CipherText, class Encrypt, decrypt, encrypt)
import Data.Crypto.Types (Document(..), DocumentId, DocumentMetaData(..))
import Data.Newtype (unwrap, wrap)
import Data.DateTime (DateTime(..))
import Data.Maybe (Maybe)

newtype JournalMeta
  = JournalMeta
    { title :: String
    , createdAt :: DateTime
    , lastUpdated :: DateTime
    , id :: Maybe DocumentId
    }

newtype JournalEntry
  = JournalEntry
    { content :: String
    , metaData :: JournalMeta
    }

instance encryptJournalEntry :: Encrypt JournalEntry Document where
  encrypt (JournalEntry entry) keyFn ring = do
    meta <- encrypt entry.metaData keyFn ring
    contents <- encrypt entry.content keyFn ring
    pure $ Document {
      metaData: meta,
      content: wrap contents
    }
  decrypt (Document document) ring = do
    meta <- decrypt document.metaData ring
    contents <- decrypt (unwrap document.content) ring
    pure $ JournalEntry {
      content: contents,
      metaData: meta
    }

instance encryptJournalMeta :: Encrypt JournalMeta DocumentMetaData where
  encrypt (JournalMeta meta) keyFn ring = do
    title <- encrypt meta.title keyFn ring
    pure $ DocumentMetaData {
      title: wrap title,
      createdAt: meta.createdAt,
      lastUpdated: meta.lastUpdated,
      id: meta.id
    }
  decrypt (DocumentMetaData documentMeta) ring = do
    let titleCt = unwrap documentMeta.title
    title <- decrypt titleCt ring
    pure $ JournalMeta {
      title: title,
      createdAt: documentMeta.createdAt,
      lastUpdated: documentMeta.lastUpdated,
      id: documentMeta.id
    }

    