module Components.NotFound where

import Prelude
  ( class Eq
  , class Ord
  , type (~>)
  , Unit
  , const
  , pure
  , ($)
  )
import Style.Bulogen
  ( container
  , hero
  , heroBody
  , subtitle
  , title
  )
import Data.Maybe (Maybe(..))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Intl (LocaliseFn)
import Intl.Terms as Term
import Intl.Terms.NotFound as NF

data Query a = Query a

type Message = Unit

data Slot = Slot
derive instance eqSlot :: Eq Slot
derive instance ordSlot :: Ord Slot

component :: forall m. LocaliseFn -> H.Component HH.HTML Query Unit Message m
component localiseFn =
  H.component
    { initialState: const localiseFn
    , render
    , eval
    , receiver: const Nothing
    }
  where

  render :: LocaliseFn -> H.ComponentHTML Query
  render state =
    let
      pageTitle = state $ Term.NotFound NF.Title
      pageExplanation = state $ Term.NotFound NF.Explanation
    in
      HH.section [HP.classes [hero]]
        [ HH.div [HP.classes [heroBody]]
          [ HH.div [HP.classes [container]]
            [ HH.h1 [ HP.classes [title]] [ HH.text pageTitle ]
            , HH.h2 [ HP.classes [subtitle]] [ HH.text pageExplanation]
            ]
          ]
        ]

  eval :: Query ~> H.ComponentDSL LocaliseFn Query Message m
  eval (Query a)= pure a