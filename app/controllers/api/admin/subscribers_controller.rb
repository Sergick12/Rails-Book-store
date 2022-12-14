# frozen_string_literal: true

module Api
  module Admin
    class SubscribersController < ApplicationController
      before_action :set_subscriber, only: %i[show edit update destroy]

      # GET /subscribers or /subscribers.json
      def index
        @subscribers = Subscriber.includes(:subscriber)
        render json: SubscriberBlueprint.render(@subscribers)
      end

      # GET /subscribers/1 or /subscribers/1.json
      def show; end

      # GET /subscribers/new
      def new
        @subscriber = Subscriber.new
      end

      # GET /subscribers/1/edit
      def edit; end

      # POST /subscribers or /subscribers.json
      def create
        @subscriber = Subscriber.new(subscriber_params)

        respond_to do |_format|
          if @subscriber.save
            render json: @subscriber, status: :created
          else
            render json: @subscriber.errors, status: :unprocessable_entity
          end
        end
      end

      # PATCH/PUT /subscribers/1 or /subscribers/1.json
      def update
        respond_to do |format|
          if @subscriber.update(subscriber_params)
            format.html { redirect_to subscriber_url(@subscriber), notice: 'Subscriber was successfully updated.' }
            format.json { render :show, status: :ok, location: @subscriber }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @subscriber.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /subscribers/1 or /subscribers/1.json
      def destroy
        @subscriber.destroy

        respond_to do |format|
          format.html { redirect_to subscribers_url, notice: 'Subscriber was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_subscriber
        @subscriber = Subscriber.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def subscriber_params
        params.require(:subscriber).permit(:name)
      end
    end
  end
end
