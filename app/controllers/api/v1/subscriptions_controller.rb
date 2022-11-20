# frozen_string_literal: true

module Api
  module V1
    class SubscriptionsController < ApplicationController
      before_action :set_subscription, only: %i[show edit update destroy]

      # GET /subscriptions or /subscriptions.json
      def index
        @subscriptions = Subscription.includes(book: %i[genres authors]).where(subscriber_id: params[:subscriber_id])
        render json: SubscriptionBlueprint.render(@subscriptions)
      end

      # GET /subscriptions/1 or /subscriptions/1.json
      def show
        @subscription = Subscription.includes(:subscriber, books: %i[genres authors]).find(params[:id])
        render json: SubscriptionBlueprint.render(@subscription)
      end

      # GET /subscriptions/new
      def new
        @subscription = Subscription.new
      end

      # GET /subscriptions/1/edit
      def edit; end

      # POST /subscriptions or /subscriptions.json
      def create
        @subscription = Subscription.new(subscription_params)

        respond_to do |_format|
          if @subscription.save
            render json: @subscription, status: :created
          else
            render json: @subscription.errors, status: :unprocessable_entity
          end
        end
      end

      # PATCH/PUT /subscriptions/1 or /subscriptions/1.json
      def update
        respond_to do |format|
          if @subscription.update(subscription_params)
            format.html do
              redirect_to subscription_url(@subscription), notice: 'Subscription was successfully updated.'
            end
            format.json { render :show, status: :ok, location: @subscription }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @subscription.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /subscriptions/1 or /subscriptions/1.json
      def destroy
        @subscription.destroy

        respond_to do |format|
          format.html { redirect_to subscriptions_url, notice: 'Subscription was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_subscription
        @subscription = Subscription.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def subscription_params
        params.require(:subscription).permit(:books_id, :subscribers_id, :delete_at, :is_active)
      end
    end
  end
end
