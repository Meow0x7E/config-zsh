#!/usr/bin/zsh

function tmp-btop() {
  btop --config <(sed -E -e 's/(shown_boxes = ").*"/\1"/' "${HOME}/.config/btop/btop.conf")
}
