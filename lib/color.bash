color::get() {
  local color=$1

  case "$color" in
    off)           printf "\033[0m" ;;# Text Reset

    bold)          printf "\033[1m" ;; # just bold
    unbold)        printf "\033[22m" ;; # normal intensity (not bold)

    # Colors
    black)         printf "\033[0;30m" ;;# black
    red)           printf "\033[0;31m" ;;# red
    green)         printf "\033[0;32m" ;;# green
    yellow)        printf "\033[0;33m" ;;# yellow
    blue)          printf "\033[0;34m" ;;# blue
    purple)        printf "\033[0;35m" ;;# purple
    cyan)          printf "\033[0;36m" ;;# cyan
    white)         printf "\033[0;37m" ;;# white

    # bold
    bblack)        printf "\033[1;30m" ;;# black
    bred)          printf "\033[1;31m" ;;# red
    bgreen)        printf "\033[1;32m" ;;# green
    byellow)       printf "\033[1;33m" ;;# yellow
    bblue)         printf "\033[1;34m" ;;# blue
    bpurple)       printf "\033[1;35m" ;;# purple
    bcyan)         printf "\033[1;36m" ;;# cyan
    bwhite)        printf "\033[1;37m" ;;# white

    # underline
    ublack)        printf "\033[4;30m" ;;# black
    ured)          printf "\033[4;31m" ;;# red
    ugreen)        printf "\033[4;32m" ;;# green
    uyellow)       printf "\033[4;33m" ;;# yellow
    ublue)         printf "\033[4;34m" ;;# blue
    upurple)       printf "\033[4;35m" ;;# purple
    ucyan)         printf "\033[4;36m" ;;# cyan
    uwhite)        printf "\033[4;37m" ;;# white

    # background
    on_black)      printf "\033[40m" ;;# black
    on_red)        printf "\033[41m" ;;# red
    on_green)      printf "\033[42m" ;;# green
    on_yellow)     printf "\033[43m" ;;# yellow
    on_blue)       printf "\033[44m" ;;# blue
    on_purple)     printf "\033[45m" ;;# purple
    on_cyan)       printf "\033[46m" ;;# cyan
    on_white)      printf "\033[47m" ;;# white

    # intense
    iblack)        printf "\033[0;90m" ;;# black
    ired)          printf "\033[0;91m" ;;# red
    igreen)        printf "\033[0;92m" ;;# green
    iyellow)       printf "\033[0;93m" ;;# yellow
    iblue)         printf "\033[0;94m" ;;# blue
    ipurple)       printf "\033[0;95m" ;;# purple
    icyan)         printf "\033[0;96m" ;;# cyan
    iwhite)        printf "\033[0;97m" ;;# white

    # bold intense
    biblack)       printf "\033[1;90m" ;;# black
    bired)         printf "\033[1;91m" ;;# red
    bigreen)       printf "\033[1;92m" ;;# green
    biyellow)      printf "\033[1;93m" ;;# yellow
    biblue)        printf "\033[1;94m" ;;# blue
    bipurple)      printf "\033[1;95m" ;;# purple
    bicyan)        printf "\033[1;96m" ;;# cyan
    biwhite)       printf "\033[1;97m" ;;# white

    # intense bg
    on_iblack)     printf "\033[0;100m" ;;# black
    on_ired)       printf "\033[0;101m" ;;# red
    on_igreen)     printf "\033[0;102m" ;;# green
    on_iyellow)    printf "\033[0;103m" ;;# yellow
    on_iblue)      printf "\033[0;104m" ;;# blue
    on_ipurple)    printf "\033[10;95m" ;;# purple
    on_icyan)      printf "\033[0;106m" ;;# cyan
    on_iwhite)     printf "\033[0;107m" ;;# white
  esac
}

color::echo() {
  local color=$1; shift
  color=$(color::get "$color")

  printf "${color}%s$(color::off)\n" "$@"
}

color::off() {
  color::get "off"
}

color::bold() {
  color::get 'bold'
}

color::unbold() {
  color::get 'unbold'
}

