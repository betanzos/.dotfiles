function get_distro_id() {

    if [ -f /etc/os-release ]; then
        . /etc/os-release
        local distro=$ID
    else
        local distro="unknown"
    fi

    echo "${distro,,}"
}
