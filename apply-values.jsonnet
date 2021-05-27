// Generated from a script
local common_values = import '~/.config/chest/common.jsonnet';
local programs = import '~/.config/chest/programs.jsonnet';
local program_specific_values = import '~/.config/chest/specific.jsonnet';

// Creates an array of dicts of values for a given program
local genValuesArray(name) =
  if std.objectHas(program_specific_values, name) then
    common_values + [program_specific_values[name]]
  else
    common_values
;

local generateFile(program_name, template) =
  template % std.foldl(function(x, y) x + y, genValuesArray(program_name), {});

local processProgram(program_name, program) =
  std.mapWithKey(function(file_name, template) generateFile(program_name, template), program);

std.foldl(function(acc, cur) acc + cur, std.objectValues(std.mapWithKey(processProgram, programs)), {})
