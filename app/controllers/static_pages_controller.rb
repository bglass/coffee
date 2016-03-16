class StaticPagesController < ApplicationController

  def datadrop
    puts "Received #{params[:order]}"

     respond_to do |format|
       format.json do
         render :json => true
       end
     end
     
   end





end
