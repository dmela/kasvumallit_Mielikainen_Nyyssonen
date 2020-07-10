################## SISÄÄNLEIVOTUT  #####################
# params  = { "plot#age", "plot#ba", "plot#dbh", "plot#hdom", "tree#frd", "tree#frh" },
# checks  = { ["tree#spe"] = "manty" },
# returns ={ "tree#+dbh" },
# coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_hdom", "log_frd", "log_frh"},
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "diameter_growth_pine")
diameter_growth_pine <- function(age, ba, dbh, hdom, frd, frh,
    c_0=5.4625, log_age=-0.6675, log_ba=-0.4758, log_dbh=0.1173, log_hdom=-0.9442, log_frd=-0.3631, log_frh=0.7762)
{
    grpd <- exp(
                c_0 
                + log_age*log(age)
                + log_ba*log(ba)
                + log_dbh*log(dbh)
                + log_hdom*log(hdom)
                + log_frd*log(frd)
                + log_frh*log(frh)
            )
    grpd/100.0*frd
}

# params  = { "plot#age", "plot#ba", "plot#dbh", "plot#h", "tree#frd", "tree#frh" },
# checks  = { ["tree#spe"] = none("manty") },
# returns ={ "tree#+dbh" },
# coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_h", "log_frd", "log_frh"},
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "diameter_growth_other")
diameter_growth_other <- function(age, ba, dbh, h, frd, frh,
    c_0=6.9342, log_age=-0.8808, log_ba=-0.4982, log_dbh=0.4159, log_h=-0.3865, log_frd=-0.6267, log_frh=0.1287)
{
    grpd <- exp(
                c_0
                + log_age*log(age)
                + log_ba*log(ba)
                + log_dbh*log(dbh)
                + log_h*log(h)
                + log_frd*log(frd)
                + log_frh*log(frh)
            )
    grpd/100.0*frd
}

# params  = { "plot#age", "tree#frd", "tree#frh" },
# checks  = { ["tree#spe"] = "manty" },
# returns ={ "tree#+h" },
# coeffs  = { "c_0", "log_age", "log_frd", "log_frh"},
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "height_growth_pine")
height_growth_pine <- function(age, frd, frh,
    c_0=5.4636, log_age=-0.9002, log_frd=0.5475, log_frh=-1.1339)
{
    grph <- exp(
                c_0
                + log_age*log(age)
                + log_frd*log(frd)
                + log_frh*log(frh)
            )
    grph/100.0*frh
}

# params  = { "plot#age", "plot#ba", "plot#dbh", "plot#h", "tree#frd", "tree#frh" },
# checks  = { ["tree#spe"] = none("manty") },
# returns ={ "tree#+h" },
# coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_h", "log_frd", "log_frh"},
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "height_growth_other")
height_growth_other <- function(age, ba, dbh, h, frd, frh,
    c_0=12.7402, log_age=-1.1786, log_ba=-0.0937, log_dbh=-0.1434, log_h=-0.8070, log_frd=0.7563, log_frh=-2.0522)
{
    grph <- (
                c_0
                + log_age*log(age)
                + log_ba*log(ba)
                + log_dbh*log(dbh)
                + log_h*log(h)
                + log_frd*log(frd)
                + log_frh*log(frh)
            )
    grph/100.0*frh
}

############## CLOSURELLA ######################
compound_interest_to_growth <- function(f)
{
  function(frx, ...)
  {
    ci <- f(frx, ...)
    ci/100.0*frx
  }
}

# params  = { "tree#frd", "plot#age", "plot#ba", "plot#dbh", "plot#hdom", "tree#frh" },
# checks  = { ["tree#spe"] = "manty" },
# returns ={ "tree#+dbh" },
# coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_hdom", "log_frd", "log_frh"},
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "diameter_growth_pine_by_ci")
diameter_growth_pine_by_ci <- compound_interest_to_growth(function(frd, age, ba, dbh, hdom, frh,
    c_0=5.4625, log_age=-0.6675, log_ba=-0.4758, log_dbh=0.1173, log_hdom=-0.9442, log_frd=-0.3631, log_frh=0.7762)
{
    exp(
        c_0 
        + log_age*log(age)
        + log_ba*log(ba)
        + log_dbh*log(dbh)
        + log_hdom*log(hdom)
        + log_frd*log(frd)
        + log_frh*log(frh)
        )
})

# params  = { "tree#frd", "plot#age", "plot#ba", "plot#dbh", "plot#h", "tree#frh" },
# checks  = { ["tree#spe"] = none("manty") },
# returns ={ "tree#+dbh" },
# coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_h", "log_frd", "log_frh"},
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "diameter_growth_other")
diameter_growth_other_by_ci <- compound_interest_to_growth(function(frd, age, ba, dbh, h, frh,
    c_0=6.9342, log_age=-0.8808, log_ba=-0.4982, log_dbh=0.4159, log_h=-0.3865, log_frd=-0.6267, log_frh=0.1287)
{
    exp(
        c_0
        + log_age*log(age)
        + log_ba*log(ba)
        + log_dbh*log(dbh)
        + log_h*log(h)
        + log_frd*log(frd)
        + log_frh*log(frh)
    )
})

# params  = { "tree#frh", "plot#age", "tree#frd" },
# checks  = { ["tree#spe"] = "manty" },
# returns ={ "tree#+height" },
# coeffs  = { "c_0", "log_age", "log_frd", "log_frh"},
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "height_growth_pine")
height_growth_pine_by_ci <- compound_interest_to_growth(function(frh, age, frd, 
    c_0=5.4636, log_age=-0.9002, log_frd=0.5475, log_frh=-1.1339)
{
    exp(
        c_0
        + log_age*log(age)
        + log_frd*log(frd)
        + log_frh*log(frh)
    )
})

# params  = { "tree#frh", "plot#age", "plot#ba", "plot#dbh", "plot#h", "tree#frd" },
# checks  = { ["tree#spe"] = none("manty") },
# returns ={ "tree#+h" },
# coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_h", "log_frd", "log_frh"},
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "height_growth_other")
height_growth_other_by_ci <- compound_interest_to_growth(function(frh, age, ba, dbh, h, frd,
    c_0=12.7402, log_age=-1.1786, log_ba=-0.0937, log_dbh=-0.1434, log_h=-0.8070, log_frd=0.7563, log_frh=-2.0522)
{
    (
        c_0
        + log_age*log(age)
        + log_ba*log(ba)
        + log_dbh*log(dbh)
        + log_h*log(h)
        + log_frd*log(frd)
        + log_frh*log(frh)
    )
})

################# APUFUNKTIOLLA ####################
convert <- function(frd, ci)
{
    ci/100.0*frd
}

# params  = { "plot#age", "plot#ba", "plot#dbh", "plot#hdom", "tree#frd", "tree#frh" },
# checks  = { ["tree#spe"] = "manty" },
# returns ={ "tree#+dbh" },
# coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_hdom", "log_frd", "log_frh"},
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "diameter_growth_pine_wrap")
diameter_growth_pine_wrap <- function(age, ba, dbh, hdom, frd, frh,
    c_0=5.4625, log_age=-0.6675, log_ba=-0.4758, log_dbh=0.1173, log_hdom=-0.9442, log_frd=-0.3631, log_frh=0.7762)
{
    ci <- exp(
                c_0 
                + log_age*log(age)
                + log_ba*log(ba)
                + log_dbh*log(dbh)
                + log_hdom*log(hdom)
                + log_frd*log(frd)
                + log_frh*log(frh)
            )
    convert(frd, ci)
}

# params  = { "plot#age", "plot#ba", "plot#dbh", "plot#h", "tree#frd", "tree#frh" },
# checks  = { ["tree#spe"] = none("manty") },
# returns ={ "tree#+dbh" },
# coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_h", "log_frd", "log_frh"},
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "diameter_growth_other")
diameter_growth_other_wrap <- function(age, ba, dbh, h, frd, frh,
    c_0=6.9342, log_age=-0.8808, log_ba=-0.4982, log_dbh=0.4159, log_h=-0.3865, log_frd=-0.6267, log_frh=0.1287)
{
  ci <- exp(
                c_0
                + log_age*log(age)
                + log_ba*log(ba)
                + log_dbh*log(dbh)
                + log_h*log(h)
                + log_frd*log(frd)
                + log_frh*log(frh)
            )
  convert(frd, ci)
}

# params  = { "plot#age", "tree#frd", "tree#frh" },
# checks  = { ["tree#spe"] = "manty" },
# returns ={ "tree#+height" },
# coeffs  = { "c_0", "log_age", "log_frd", "log_frh"},
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "height_growth_pine")
height_growth_pine_wrap <- function(age, frd, frh,
    c_0=5.4636, log_age=-0.9002, log_frd=0.5475, log_frh=-1.1339)
{
    ci <- exp(
                c_0
                + log_age*log(age)
                + log_frd*log(frd)
                + log_frh*log(frh)
            )
    convert(frh, ci)
}

# params  = { "plot#age", "plot#ba", "plot#dbh", "plot#h", "tree#frd", "tree#frh" },
# checks  = { ["tree#spe"] = none("manty") },
# returns ={ "tree#+h" },
# coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_h", "log_frd", "log_frh"},
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "height_growth_other")
height_growth_other_wrap <- function(age, ba, dbh, h, frd, frh,
    c_0=12.7402, log_age=-1.1786, log_ba=-0.0937, log_dbh=-0.1434, log_h=-0.8070, log_frd=0.7563, log_frh=-2.0522)
{
    ci <- (
                c_0
                + log_age*log(age)
                + log_ba*log(ba)
                + log_dbh*log(dbh)
                + log_h*log(h)
                + log_frd*log(frd)
                + log_frh*log(frh)
            )
    convert(frh, ci)
}

################# ERILLISINÄ FUNKTIOINA ####################

# params = { "tree#frd", "aggregate#cid" }
# returns = { "tree#+dbh" },
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "convert_ci")
# params = { "tree#frh", "aggregate#cih" }
# returns = { "tree#+h" },
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "convert_ci")
convert_ci <- function(frd, ci)
{
    ci/100.0*frd
}

# params  = { "plot#age", "plot#ba", "plot#dbh", "plot#hdom", "tree#frd", "tree#frh" },
# checks  = { ["tree#spe"] = "manty" },
# returns = { "aggregate#cid" },
# coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_hdom", "log_frd", "log_frh"},
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "diameter_growth_pine_wrap")
diameter_growth_pine_separate <- function(age, ba, dbh, hdom, frd, frh,
    c_0=5.4625, log_age=-0.6675, log_ba=-0.4758, log_dbh=0.1173, log_hdom=-0.9442, log_frd=-0.3631, log_frh=0.7762)
{
    exp(
        c_0 
        + log_age*log(age)
        + log_ba*log(ba)
        + log_dbh*log(dbh)
        + log_hdom*log(hdom)
        + log_frd*log(frd)
        + log_frh*log(frh)
    )
}

# params  = { "plot#age", "plot#ba", "plot#dbh", "plot#h", "tree#frd", "tree#frh" },
# checks  = { ["tree#spe"] = none("manty") },
# returns ={ "aggregate#ci" },
# coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_h", "log_frd", "log_frh"},
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "diameter_growth_other")
diameter_growth_other_separate <- function(age, ba, dbh, h, frd, frh,
    c_0=6.9342, log_age=-0.8808, log_ba=-0.4982, log_dbh=0.4159, log_h=-0.3865, log_frd=-0.6267, log_frh=0.1287)
{
    exp(
        c_0
        + log_age*log(age)
        + log_ba*log(ba)
        + log_dbh*log(dbh)
        + log_h*log(h)
        + log_frd*log(frd)
        + log_frh*log(frh)
    )
}

# params  = { "plot#age", "tree#frd", "tree#frh" },
# checks  = { ["tree#spe"] = "manty" },
# returns ={ "aggregate#ci" },
# coeffs  = { "c_0", "log_age", "log_frd", "log_frh"},
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "height_growth_pine")
height_growth_pine_separate <- function(age, frd, frh,
    c_0=5.4636, log_age=-0.9002, log_frd=0.5475, log_frh=-1.1339)
{
    exp(
        c_0
        + log_age*log(age)
        + log_frd*log(frd)
        + log_frh*log(frh)
    )
}

# params  = { "plot#age", "plot#ba", "plot#dbh", "plot#h", "tree#frd", "tree#frh" },
# checks  = { ["tree#spe"] = none("manty") },
# returns ={ "aggregate#ci" },
# coeffs  = { "c_0", "log_age", "log_ba", "log_dbh", "log_h", "log_frd", "log_frh"},
# impl    = mdef("kasvumallit_Mielikainen_Nyyssonen.R", "height_growth_other")
height_growth_other_separate <- function(age, ba, dbh, h, frd, frh,
    c_0=12.7402, log_age=-1.1786, log_ba=-0.0937, log_dbh=-0.1434, log_h=-0.8070, log_frd=0.7563, log_frh=-2.0522)
{
    (
        c_0
        + log_age*log(age)
        + log_ba*log(ba)
        + log_dbh*log(dbh)
        + log_h*log(h)
        + log_frd*log(frd)
        + log_frh*log(frh)
    )
}

############## ESIMERKIKUTSUT  #########################
age <- 1
ba <- 2
dgm <- 3
h <- 4
hdom <- 4
frd <- 5
frh <- 6

# Sisäänleivotut
diameter_growth_pine(age, ba, dgm, hdom, frd, frh)
diameter_growth_other(age, ba, dgm, h, frd, frh)
height_growth_pine(age, frd, frh)
height_growth_other(age, ba, dgm, h, frd, frh)
# Closurella
diameter_growth_pine_by_ci(frd, age, ba, dgm, hdom, frh)
diameter_growth_other_by_ci(frd, age, ba, dgm, h, frh)
height_growth_pine_by_ci(frh, age, frd)
height_growth_other_by_ci(frh, age, ba, dgm, h, frd)
# Apufunktiolla
diameter_growth_pine_wrap(age, ba, dgm, hdom, frd, frh)
diameter_growth_other_wrap(age, ba, dgm, h, frd, frh)
height_growth_pine_wrap(age, frd, frh)
height_growth_other_wrap(age, ba, dgm, h, frd, frh)
# Erillisinä funktioina
convert(frd, diameter_growth_pine_separate(age, ba, dgm, hdom, frd, frh) )
convert(frd, diameter_growth_other_separate(age, ba, dgm, h, frd, frh) )
convert(frh, height_growth_pine_separate(age, frd, frh) )
convert(frh, height_growth_other_separate(age, ba, dgm, h, frd, frh) )
