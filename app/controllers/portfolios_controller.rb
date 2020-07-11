class PortfoliosController < ApplicationController
    def index
        @portfolio = Portfolio.all
    end

    def new
        @portfolio = Portfolio.new
    end

    def angular
        @portfolioangular = Portfolio.angular

    end

    def create
        @portfolio = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
        respond_to do |format|
            if @portfolio.save
                format.html { redirect_to portfolios_path, notice: 'Portfolio created' }
            else
                format.html {redirect_to new_portfolio_path}
            end
            
        end
    end

    def show
        @portfolio = Portfolio.find(params[:id])
    end

    def edit
        @portfolio = Portfolio.find(params[:id])
        @url = params
    end

    def destroy
        @portfolio = Portfolio.find(params[:id])
        @portfolio.destroy
        respond_to do |format|
          format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully deleted.' }
          format.json { head :no_content }
        end
    
    end

    def update
        @portfolio = Portfolio.find(params[:id])
        respond_to do |format|
            if @portfolio.update(params.require(:portfolio).permit(:title, :subtitle, :body))
                format.html {  redirect_to portfolios_path, notice: 'Portfolio updated'  }
            else
                format.html { redirect_to :edit }
            end
        end
    end
end
