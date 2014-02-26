class LanguageDetailsControllerStylesheet < ApplicationStylesheet

  def header st
    st.frame = { l: 0, t: 0, w: app_width, h: 60 }
  end

  def language_name st
    st.frame = { l: margin, t: margin_double, w: app_width, h: 25 }
    st.number_of_lines = :unlimited
    st.font = font.larger
    st.background_color = color.light_gray
  end

  def author_name_label st
    info_label st
  end

  def author_name st
    st.padded = {l: (app_width/2), t: 0, r: 0} 
    st.height = 25
    st.font = font.large
    st.frame = { l: margin }
  end

  def static_label st
    info_label st
  end

  def static_value st
    st.padded = {l: 0, t: 0, r: 0} 
    st.height = 25
    st.font = font.large
    st.frame = { l: margin }
  end

  def dynamic_label st
    static_label st
  end

  def dynamic_value st
    static_value st
  end

  def layout_header(header_view_rmq)
    header_view_rmq.children.distribute(:vertical, 
                                        margin: 10, 
                                        margins: [0, margin_and_half, margin_and_half, margin_section])
    header_view_rmq.resize_to_fit_subviews
  end

  def table(st)
    st.view.separatorColor = color.clear
    st.view.contentInset = [0,0,margin_double,0]
    st.view.allowsSelection = false
  end

  def info_label(st)
    st.frame = :full
    st.height = 20
    st.font = font.medium
    st.color = color.dim_gray
    st.frame = { l: margin }
  end

end
