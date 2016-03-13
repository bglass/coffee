module StaticPagesHelper
  def data_next(page)
    i = @pages.index(page)
    i < @pages.count-1 ? "##{@pages[i+1]}" : nil
  end
  def data_prev(page)
    i = @pages.index(page)
    i > 0 ? "##{@pages[i-1]}" : nil
  end
end
