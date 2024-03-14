# ActiveSupport::Notifications.subscribe(
#   "transaction.active_record"
# ) do |event|
#   # MetricsLogger.record_transaction(event.payload)
# end