# Nushell Lf File

def "lf last-dir" [] {
    let tmp = (mktemp)
    let pwd = (pwd)

    lf -last-dir-path $tmp

    if not ($tmp | path exists) {
        return $pwd
    }

    let last_dir = ($tmp | open)
    rm -f $tmp

    if ($last_dir | path type) != "dir" {
        return $pwd
    }

    if $last_dir == $pwd {
        return $pwd
    }

    $last_dir
}
