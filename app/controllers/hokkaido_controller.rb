class HokkaidoController < ApplicationController
    def index
    end
    
    def edit
        if !params.has_key?(:hvalue) then
        @hvalue = Hvalue.new
        else
        @hvalue = Hvalue.find_by(N03_004: params[:hvalue][:N03_004])
        @value = [["会社No.1", "1"], ["会社No.2", "2"], ["会社No.3", "3"], ["会社No.4", "4"], ["会社No.5", "5"], ["会社No.6", "6"], 
                  ["会社No.7", "7"], ["会社No.8", "8"], ["会社No.9", "9"], ["会社No.10", "10"], ["会社No.11", "11"], ["会社No.12", "12"], 
                  ["会社No.13", "13"], ["会社No.14", "14"], ["会社No.15", "15"], ["会社No.16", "16"], ["会社No.17", "17"], ["会社No.18", "18"], 
                  ["会社No.19", "19"], ["会社No.20", "20"], ["会社No.21", "21"], ["会社No.22", "22"], ["会社No.23", "23"], ["不明", "0"], ]
        @column = [:vender, :eac, :frs, :eps, :ca, :pa, :gw, :cms, :mail, :bu, :rs, :ps, :fn, :ns, :ss, :ft, :et, :ib]
        end
    end
    
    def update
        # render :json => params[:hvalue]
        @hvalue = Hvalue.find_by(N03_004: params[:hvalue][:N03_004])
        if @hvalue.update_attributes(hvalue_params) 
            # moji = @hvalue.previous_changes() 
            flash[:success] = params[:hvalue][:N03_004] + "の情報を更新しました"
            redirect_to :action => "edit"
        else
            flash[:success] = "変更に失敗しました"
            render 'edit'
        end
    end
    
    def hokkaido_map
        data = File.read("db/hokkaido_map.json")
        render :json => data
    end
    
    def hokkaido_value
        data = Hvalue.all
        render json: data.to_json(:except => [:id, :created_at, :updated_at])
    end
    
    private

    def hvalue_params
      params.require(:hvalue).permit(:vender, :eac, :frs, :eps, :ca, :pa, :gw, :cms, :mail, :bu, :rs, :ps, :fn, :ns, :ss, :ft, :et, :ib)
    end
end