{-
Copyright 2018 James Laver

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-}
module Style.Bulogen.Elements where

import Data.Array (snoc)
import Halogen.HTML (ClassName, ElemName(..), HTML)
import Style.Bulogen.TypeDefs (ClassProps)

import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

element ::
  forall p i t2.
  String ->
  Array (HP.IProp t2 i) ->
  Array (HTML p i) ->
  HTML p i
element name = HH.element (ElemName name)

withClasses :: forall r i. Array ClassName -> ClassProps r i -> ClassProps r i
withClasses cs as = snoc as (HP.classes cs)

classy ::
  forall r p i.
  String ->
  Array ClassName ->
  ClassProps r i ->
  Array (HTML p i) ->
  HTML p i
classy elem cs as = element elem (withClasses cs as)

classier ::
  forall p i.
  String ->
  Array ClassName ->
  Array (HTML p i) ->
  HTML p i
classier elem cs = classy elem cs []

a ::
  forall r p i.
  Array ClassName ->
  ClassProps r i ->
  Array (HTML p i) ->
  HTML p i
a = classy "a"

a_ :: forall p i. Array ClassName -> Array (HTML p i) -> HTML p i
a_ = classier "a"

abbr = classy "abbr"

abbr_ = classier "abbr"

address = classy "address"

address_ = classier "address"

area = classy "area"

area_ = classier "area"

article = classy "article"

article_ = classier "article"

aside = classy "aside"

aside_ = classier "aside"

audio = classy "audio"

audio_ = classier "audio"

b = classy "b"

b_ = classier "b"

base = classy "base"

base_ = classier "base"

bdi = classy "bdi"

bdi_ = classier "bdi"

bdo = classy "bdo"

bdo_ = classier "bdo"

blockquote = classy "blockquote"

blockquote_ = classier "blockquote"

body = classy "body"

body_ = classier "body"

br = classy "br"

br_ = classier "br"

button = classy "button"

button_ = classier "button"

canvas = classy "canvas"

canvas_ = classier "canvas"

caption = classy "caption"

caption_ = classier "caption"

cite = classy "cite"

cite_ = classier "cite"

code = classy "code"

code_ = classier "code"

col = classy "col"

col_ = classier "col"

colgroup = classy "colgroup"

colgroup_ = classier "colgroup"

command = classy "command"

command_ = classier "command"

datalist = classy "datalist"

datalist_ = classier "datalist"

dd = classy "dd"

dd_ = classier "dd"

del = classy "del"

del_ = classier "del"

details = classy "details"

details_ = classier "details"

dfn = classy "dfn"

dfn_ = classier "dfn"

dialog = classy "dialog"

dialog_ = classier "dialog"

div = classy "div"

div_ = classier "div"

dl = classy "dl"

dl_ = classier "dl"

dt = classy "dt"

dt_ = classier "dt"

em = classy "em"

em_ = classier "em"

embed = classy "embed"

embed_ = classier "embed"

fieldset = classy "fieldset"

fieldset_ = classier "fieldset"

figcaption = classy "figcaption"

figcaption_ = classier "figcaption"

figure = classy "figure"

figure_ = classier "figure"

footer = classy "footer"

footer_ = classier "footer"

form = classy "form"

form_ = classier "form"

h1 = classy "h1"

h1_ = classier "h1"

h1__ = classier "h1_"

h2 = classy "h2"

h2_ = classier "h2"

h3 = classy "h3"

h3_ = classier "h3"

h4 = classy "h4"

h4_ = classier "h4"

h5 = classy "h5"

h5_ = classier "h5"

h6 = classy "h6"

h6_ = classier "h6"

head = classy "head"

head_ = classier "head"

header = classy "header"

header_ = classier "header"

hr = classy "hr"

hr_ = classier "hr"

i = classy "i"

i_ = classier "i"

iframe = classy "iframe"

iframe_ = classier "iframe"

img = classy "img"

img_ = classier "img"

input = classy "input"

input_ = classier "input"

ins = classy "ins"

ins_ = classier "ins"

kbd = classy "kbd"

kbd_ = classier "kbd"

label = classy "label"

label_ = classier "label"

legend = classy "legend"

legend_ = classier "legend"

li = classy "li"

li_ = classier "li"

link = classy "link"

link_ = classier "link"

main = classy "main"

main_ = classier "main"

map = classy "map"

map_ = classier "map"

mark = classy "mark"

mark_ = classier "mark"

menu = classy "menu"

menu_ = classier "menu"

menuitem = classy "menuitem"

menuitem_ = classier "menuitem"

meta = classy "meta"

meta_ = classier "meta"

meter = classy "meter"

meter_ = classier "meter"

nav = classy "nav"

nav_ = classier "nav"

noscript = classy "noscript"

noscript_ = classier "noscript"

object = classy "object"

object_ = classier "object"

ol = classy "ol"

ol_ = classier "ol"

optgroup = classy "optgroup"

optgroup_ = classier "optgroup"

option = classy "option"

option_ = classier "option"

output = classy "output"

output_ = classier "output"

p = classy "p"

p_ = classier "p"

pre = classy "pre"

pre_ = classier "pre"

param = classy "param"

param_ = classier "param"

progress = classy "progress"

progress_ = classier "progress"

q = classy "q"

q_ = classier "q"

rp = classy "rp"

rp_ = classier "rp"

rt = classy "rt"

rt_ = classier "rt"

ruby = classy "ruby"

ruby_ = classier "ruby"

samp = classy "samp"

samp_ = classier "samp"

script = classy "script"

script_ = classier "script"

section = classy "section"

section_ = classier "section"

select = classy "select"

select_ = classier "select"

small = classy "small"

small_ = classier "small"

source = classy "source"

source_ = classier "source"

span = classy "span"

span_ = classier "span"

strong = classy "strong"

strong_ = classier "strong"

style = classy "style"

style_ = classier "style"

sub = classy "sub"

sub_ = classier "sub"

summary = classy "summary"

summary_ = classier "summary"

sup = classy "sup"

sup_ = classier "sup"

table = classy "table"

table_ = classier "table"

tbody = classy "tbody"

tbody_ = classier "tbody"

td = classy "td"

td_ = classier "td"

textarea = classy "textarea"

textarea_ = classier "textarea"

tfoot = classy "tfoot"

tfoot_ = classier "tfoot"

th = classy "th"

th_ = classier "th"

thead = classy "thead"

thead_ = classier "thead"

time = classy "time"

time_ = classier "time"

title = classy "title"

title_ = classier "title"

tr = classy "tr"

tr_ = classier "tr"

track = classy "track"

track_ = classier "track"

u = classy "u"

u_ = classier "u"

ul = classy "ul"

ul_ = classier "ul"

var = classy "var"

var_ = classier "var"

video = classy "video"

video_ = classier "video"

wbr = classy "wbr"

wbr_ = classier "wbr"
