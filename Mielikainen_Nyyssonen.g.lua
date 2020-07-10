local mdef = function(f, func) return string.format("R::%s.r::%s", f, func) end

model.diameter_growth_pine {
    params  = { "plot#age", "plot#ba", "plot#dbh", "plot#hdom", "tree#frd", "tree#frh" },
    checks  = { ["tree#spe"] = "manty" },
    returns ={ "tree#+dbh" },
    coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_hdom", "log_frd", "log_frh"},
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "diameter_growth_pine")
}

model.diameter_growth_other {
    params  = { "plot#age", "plot#ba", "plot#dbh", "plot#h", "tree#frd", "tree#frh" },
    checks  = { ["tree#spe"] = none("manty") },
    returns ={ "tree#+dbh" },
    coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_h", "log_frd", "log_frh"},
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "diameter_growth_other")
}

model.height_growth_pine {
    params  = { "plot#age", "tree#frd", "tree#frh" },
    checks  = { ["tree#spe"] = "manty" },
    returns ={ "tree#+h" },
    coeffs  = { "c_0", "log_age", "log_frd", "log_frh"},
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "height_growth_pine")
}

model.height_growth_other {
    params  = { "plot#age", "plot#ba", "plot#dbh", "plot#h", "tree#frd", "tree#frh" },
    checks  = { ["tree#spe"] = none("manty") },
    returns ={ "tree#+h" },
    coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_h", "log_frd", "log_frh"},
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "height_growth_other")
}

model.diameter_growth_pine_by_ci {
    params  = { "plot#age", "plot#ba", "plot#dbh", "plot#hdom", "tree#frd", "tree#frh" },
    checks  = { ["tree#spe"] = "manty" },
    returns ={ "tree#+dbh" },
    coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_hdom", "log_frd", "log_frh"},
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "diameter_growth_pine_by_ci")
}

model.diameter_growth_other_by_ci {
    params  = { "plot#age", "plot#ba", "plot#dbh", "plot#h", "tree#frd", "tree#frh" },
    checks  = { ["tree#spe"] = none("manty") },
    returns ={ "tree#+dbh" },
    coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_h", "log_frd", "log_frh"},
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "diameter_growth_other")
}

model.height_growth_pine_by_ci {
    params  = { "plot#age", "tree#frd", "tree#frh" },
    checks  = { ["tree#spe"] = "manty" },
    returns ={ "tree#+height" },
    coeffs  = { "c_0", "log_age", "log_frd", "log_frh"},
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "height_growth_pine")
}

model.height_growth_other_by_ci {
    params  = { "plot#age", "plot#ba", "plot#dbh", "plot#h", "tree#frd", "tree#frh" },
    checks  = { ["tree#spe"] = none("manty") },
    returns ={ "tree#+h" },
    coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_h", "log_frd", "log_frh"},
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "height_growth_other")
}

model.diameter_growth_pine_wrap {
    params  = { "plot#age", "plot#ba", "plot#dbh", "plot#hdom", "tree#frd", "tree#frh" },
    checks  = { ["tree#spe"] = "manty" },
    returns ={ "tree#+dbh" },
    coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_hdom", "log_frd", "log_frh"},
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "diameter_growth_pine_wrap")
}

model.diameter_growth_other_wrap {
    params  = { "plot#age", "plot#ba", "plot#dbh", "plot#h", "tree#frd", "tree#frh" },
    checks  = { ["tree#spe"] = none("manty") },
    returns ={ "tree#+dbh" },
    coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_h", "log_frd", "log_frh"},
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "diameter_growth_other")
}

model.height_growth_pine_wrap {
    params  = { "plot#age", "tree#frd", "tree#frh" },
    checks  = { ["tree#spe"] = "manty" },
    returns ={ "tree#+height" },
    coeffs  = { "c_0", "log_age", "log_frd", "log_frh"},
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "height_growth_pine")
}

model.height_growth_other_wrap {
    params  = { "plot#age", "plot#ba", "plot#dbh", "plot#h", "tree#frd", "tree#frh" },
    checks  = { ["tree#spe"] = none("manty") },
    returns ={ "tree#+h" },
    coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_h", "log_frd", "log_frh"},
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "height_growth_other")
}

model.convert_cid {
    params = { "tree#frd", "aggregate#cid" },
    returns = { "tree#+dbh" },
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "convert_ci")
}

model.convert_cih {
    params = { "tree#frh", "aggregate#cih" },
    returns = { "tree#+h" },
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "convert_ci")
}

model.diameter_growth_pine_separate {
    params  = { "plot#age", "plot#ba", "plot#dbh", "plot#hdom", "tree#frd", "tree#frh" },
    checks  = { ["tree#spe"] = "manty" },
    returns = { "aggregate#cid" },
    coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_hdom", "log_frd", "log_frh"},
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "diameter_growth_pine_wrap")
}

model.diameter_growth_other_separate {
    params  = { "plot#age", "plot#ba", "plot#dbh", "plot#h", "tree#frd", "tree#frh" },
    checks  = { ["tree#spe"] = none("manty") },
    returns ={ "aggregate#ci" },
    coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_h", "log_frd", "log_frh"},
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "diameter_growth_other")
}

model.height_growth_pine_separate {
    params  = { "plot#age", "tree#frd", "tree#frh" },
    checks  = { ["tree#spe"] = "manty" },
    returns ={ "aggregate#ci" },
    coeffs  = { "c_0", "log_age", "log_frd", "log_frh"},
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "height_growth_pine")
}

model.height_growth_other_separate {
    params  = { "plot#age", "plot#ba", "plot#dbh", "plot#h", "tree#frd", "tree#frh" },
    checks  = { ["tree#spe"] = none("manty") },
    returns ={ "aggregate#ci" },
    coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_h", "log_frd", "log_frh"},
    impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "height_growth_other")
}