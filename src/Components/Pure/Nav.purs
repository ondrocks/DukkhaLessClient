module Components.Pure.Nav where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Routing.Routes as R
import Data.Routing.Routes.Journals as RJ
import Data.Routing.Routes.Sessions as RS
import Halogen.HTML (HTML)
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Model (Session)
import Style.Bulogen as SB

sessionlessMenuItems
 :: forall a b
 . Array (HTML a b)
sessionlessMenuItems =
   [ HH.ul_ (map link [R.Intro, R.Resources, R.Sessions RS.Login])
    ]

navWrapper
  :: forall a b
  .  Array (HTML a b)
  -> HTML a b
navWrapper items = HH.nav
    [ HP.classes
      [ SB.navbar
      , SB.success
      ]
    ]
    items
   
sessionlessMenu
  :: forall a b
  .  HTML a b
sessionlessMenu = navWrapper sessionlessMenuItems

sessionedMenu
  :: forall a b
  .  Session
  -> HTML a b
sessionedMenu = sessionedMenuItems >>> navWrapper

sessionedMenuItems
  :: forall a b
  . Session
  -> Array (HTML a b)
sessionedMenuItems _ =
    [ HH.ul_ (map link [R.Intro, R.Resources, R.Journals $ RJ.Edit Nothing])
    ]

link :: forall a b. R.Routes -> HTML a b
link r = HH.li_ [ HH.a [ HP.href $ R.reverseRoute r ] [ HH.text $ R.reverseRoute r ] ]
