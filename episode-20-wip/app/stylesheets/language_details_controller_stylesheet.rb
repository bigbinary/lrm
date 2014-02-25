class LanguageDetailsControllerStylesheet < ApplicationStylesheet

  def header st
    st.frame = { l: 0, t: 0, w: app_width, h: 60 }
  end

  def language_name st
    st.frame = { l: margin, t: margin_double, w: app_width, h: 25 }
    st.number_of_lines = :unlimited
    st.font = font.larger
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

end
