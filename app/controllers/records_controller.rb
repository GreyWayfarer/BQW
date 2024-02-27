class RecordsController < ApplicationController
    before_action :set_record, only: %i[show destroy]

    def new
        @record = Record.new
    end

    def create
        #uri = URI.parse("https://rosreestr.gov.ru/fir_lite_rest/api/gkn/fir_object/#{@record.cadnumber}")
        #response = Net::HTTP.get_response(uri)
        #p response
        response = {"objectId":"54:32:10641:12","type":"parcel","regionKey":154,"source":1,"firActualDate":"2022-02-14","objectData":{"id":"54:32:10641:12","regionKey":154,"srcObject":1,"objectType":"002001001000","objectName":"01","removed":0,"dateLoad":"2022-02-14","addressNote":"обл. Новосибирская, г. Бердск, садоводческий потребительский кооператив \"Восток-1\", улица Железнодорожная, 73","objectCn":"54:32:010641:12","rsCode":"54.0.2.1","actualDate":"2022-02-14","brkStatus":-1,"objectAddress":{"id":"54:32:10641:12","regionKey":154,"okato":"50408000000","kladr":"5400000200000","region":"54","place":"Бердск","placeType":"г","addressNotes":"обл. Новосибирская, г. Бердск, садоводческий потребительский кооператив \"Восток-1\", улица Железнодорожная, 73","mergedAddress":"г Бердск"}},"parcelData":{"id":"54:32:10641:12","regionKey":154,"parcelCn":"54:32:010641:12","parcelStatus":"01","dateCreate":"2003-12-08","categoryType":"003002000000","areaValue":398.0,"areaType":"009","areaUnit":"055","rightsReg":true,"cadCost":77784.36,"cadUnit":"383","dateCost":"2021-01-01","oksFlag":0,"oksInventoryCost":0.0,"utilCode":"141004000000","utilByDoc":"Для ведения садоводства и огородничества"}}
        @record = Record.new(record_params)
        @record.json_data = response
        if @record.save
            redirect_to root_path, notice: 'Record created successfully'
        else
            render :new, alert: 'Object save error'
        end
    end

    def show
    end

    def destroy
        @record.destroy
        redirect_to root_path, notice: 'Load was successfully deleted'
    end

    private

    def set_record
        @record = Record.find(params[:id])
    end

    def record_params
        params.require(:record).permit(:cadnumber)
    end
end
