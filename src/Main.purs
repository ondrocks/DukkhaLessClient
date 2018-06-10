{-
    The MySelfCare Client is a web application designed to give people
    a safe space to write their innermost thoughts and help them
    monitor their mental health.
    Copyright (C) 2018  Alexandra DeWit

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
-}

module Main where

import Prelude

import Button as B
import Effect (Effect)
import Effect.Class (liftEffect)
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)
import Intl.Locales (preferredUserLanguages)
import Intl         (localiseString)

main :: Effect Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  userLanguages <- liftEffect preferredUserLanguages
  let translate = localiseString userLanguages
  runUI B.myButton unit body