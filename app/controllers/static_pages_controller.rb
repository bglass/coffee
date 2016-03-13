class StaticPagesController < ApplicationController
  def order
    @pages = %w[group drinks summary]
  end
end
