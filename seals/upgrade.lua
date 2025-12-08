SMODS.Sticker {
    key = 'upgrade',
    atlas = 'bld_enhance', 
    pos = { x = 0, y = 2 },
    badge_colour = HEX("6A758A"),
    should_apply = false,
    config = {},
    rate = 0,

    apply = function(self, card, val)
      card.ability[self.key] = val
      card.ability.extra = card.ability.extra.upgrade or card.ability.extra
    end
}