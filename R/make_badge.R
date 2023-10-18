if(interactive()){
imgurl = magick::image_read('inst/shiny_plate_for_badge.png')

hexSticker::sticker(imgurl, package="shiny.plate", p_size=20, p_y = 1.5, s_x = 1.05, p_color = 'black', s_width=1.2, s_height = 1.2, h_fill="white", h_color="black",
        filename="inst/figures/shiny_plate_badge.png")
}
