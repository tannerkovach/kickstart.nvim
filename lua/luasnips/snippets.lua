local ls = require 'luasnip'
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require('luasnip.extras').lambda
local rep = require('luasnip.extras').rep
local p = require('luasnip.extras').partial
local m = require('luasnip.extras').match
local n = require('luasnip.extras').nonempty
local dl = require('luasnip.extras').dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local types = require 'luasnip.util.types'
local conds = require 'luasnip.extras.conditions'
local conds_expand = require 'luasnip.extras.conditions.expand'

ls.add_snippets('all', {
  s('ternary', {
    -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
    i(1, 'cond'),
    t ' ? ',
    i(2, 'then'),
    t ' : ',
    i(3, 'else'),
  }),
})

ls.add_snippets('liquid', {
  s('ife', {
    t '{% if ',
    i(1, 'cond'),
    t { ' %}', '' },
    i(2, 'then'),
    t { '', '{% endif %}' },
  }),

  s('un', {
    t '{% unless ',
    i(1, 'cond'),
    t { ' %}', '' },
    i(2, 'then'),
    t { '', '{% endunless %}' },
  }),

  s('if', {
    t '{% if ',
    i(1, 'cond'),
    t { ' %}' },
  }),

  s('el', {
    t '{% else %}',
  }),

  s('els', {
    t '{% elsif ',
    i(1, 'cond'),
    t ' %}',
  }),

  s('rend', {
    t "{% render '",
    i(1, 'file'),
    t "' ",
    i(2, 'attr'),
    t ' %}',
  }),

  s('end', {
    t '{% endif %}',
  }),
})
