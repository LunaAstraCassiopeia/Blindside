SMODS.Tag {
    key = "collector",
    hide_ability = false,
    atlas = 'bld_tag',
    pos = {x = 0, y = 2},
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
    apply = function(self, tag, context)
        if context.type == 'symbol_pack_opened'  then
            tag:yep('+', G.C.DARK_EDITION, function()
                return true
            end)
            G.E_MANAGER:add_event(Event({trigger = 'after', func = function()
                    if G.pack_cards and G.pack_cards.cards ~= nil and G.pack_cards.cards[1] and G.pack_cards.VT.y < G.ROOM.T.h then
                        for _, v in ipairs(G.pack_cards.cards) do
                            local edition = poll_edition('collector', nil, true, true, BLINDSIDE.get_blindside_editions())
                            v:set_edition(edition, true)
                        end
                    return true
                end
            end}))
            tag.triggered = true
        end
    end,

}
