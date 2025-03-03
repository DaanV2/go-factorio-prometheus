/silent-command
local lines = {};
local force = game.forces["player"];
if force then
    for _, surface in pairs(game.surfaces) do
        local stats = force.get_fluid_production_statistics(surface.index);
        for k, v in pairs(stats.storage_counts) do
            table.insert(lines, string.format("%s,%s,%s,%s", v, k, surface.name, force.name))
        end
    end
end
rcon.print(table.concat(lines, "\n"))
