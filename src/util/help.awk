# Lists Makefile targets documented with a `## [group] description` line (or
# `## [group:parent] description` for a sub-target) placed directly above the rule.
# Usage: awk -v spec='<group|description;...>' -v mode=<summary|list|all> [-v grp=<group>] -f help.awk <makefiles>

function warn(msg) {
    print "help: " msg > "/dev/stderr"
}

BEGIN {
    ng = split(spec, parts, ";")
    for (i = 1; i <= ng; i++) {
        sub(/^ +/, "", parts[i])
        if (parts[i] == "") {
            continue
        }
        split(parts[i], kv, "|")
        order[++norder] = kv[1]
        desc[kv[1]] = kv[2]
    }
}

/^## \[[A-Za-z0-9_-]+(:[A-Za-z0-9_.-]+)?\] / {
    match($0, /\] /)
    split(substr($0, 5, RSTART - 5), tag, ":")
    g = tag[1]
    par = tag[2]
    d = substr($0, RSTART + 2)
    next
}

d != "" {
    if ($0 ~ /^[A-Za-z0-9_.-]+:([^=]|$)/) {
        t = $0
        sub(/:.*/, "", t)
        if (!(g in desc)) {
            warn("unknown group '" g "' for target '" t "'")
        } else if (par == "") {
            n[g]++
            tgt[g, n[g]] = t
            txt[g, n[g]] = d
            grp_of[t] = g
        } else {
            nk[par]++
            kid[par, nk[par]] = t
            kid_txt[par, nk[par]] = d
            kid_grp[par, nk[par]] = g
        }
    }
    d = ""
}

function show(g,    i, p, j) {
    if (n[g] == 0) {
        return
    }
    if (desc[g] == "") {
        printf "\n%s\n", g
    } else {
        printf "\n%s (%s)\n", g, desc[g]
    }
    for (i = 1; i <= n[g]; i++) {
        p = tgt[g, i]
        printf "  %-26s %s\n", p, txt[g, i]
        for (j = 1; j <= nk[p]; j++) {
            printf "    %-24s %s\n", kid[p, j], kid_txt[p, j]
        }
    }
}

END {
    for (p in nk) {
        if (!(p in grp_of)) {
            warn("parent '" p "' is not a documented target")
            continue
        }
        for (j = 1; j <= nk[p]; j++) {
            if (kid_grp[p, j] != grp_of[p]) {
                warn("group of '" kid[p, j] "' differs from its parent '" p "'")
            }
        }
    }
    for (i = 1; i <= norder; i++) {
        g = order[i]
        if (mode == "summary" && n[g] > 0) {
            printf "  %-18s %s\n", "help-" g, desc[g]
        } else if (mode == "all" || (mode == "list" && g == grp)) {
            show(g)
        }
    }
}
