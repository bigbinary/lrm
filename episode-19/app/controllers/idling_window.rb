# This is how this class works.
#
# A timer is set when application boots and whenver a user event is detected. 
# That timer will invoke method to lock the screen based on LOCK_TIME.
# The only way to cancel that operation is to cancel the timer before the screen is locked.
#
# That timer is cancelled anytime a user event is detected.
#
# So if a user event is not detected within the given LOCK_TIME the screen will be locked.
class IdlingWindow < UIWindow

  BECAME_IDLE = "com.bigbinary.notifications.BecameIdle"
  BECAME_ACTIVE = "com.bigbinary.notifications.BecameActive"

  attr_accessor :idle_timer
  attr_reader :idle_timeout_seconds

  def initWithFrame(frame)
    if super
      @idle_timeout_seconds = 0
    end

    self
  end

  def sendEvent event
    super event

    user_event if user_triggered_event?(event)
  end

  def set_idle_timeout_seconds seconds
    @idle_timeout_seconds = seconds

    set_timer
  end

  def dealloc
    if idle_timer
      BW::Reactor.cancel_timer(idle_timer)
      self.idle_timer = nil
    end

    super.dealloc
  end

  private

  def user_event
    idle_timer ? BW::Reactor.cancel_timer(idle_timer) : became_active_notification

    set_timer
  end

  def became_active_notification
    App.notification_center.post(BECAME_ACTIVE, self)
  end

  def became_idle_notification
    App.notification_center.post(BECAME_IDLE, self)
    self.idle_timer = nil
  end

  def set_timer
    BW::Reactor.cancel_timer(idle_timer) if idle_timer

    if (idle_timeout_seconds > 0)
      self.idle_timer = BW::Reactor.add_timer(idle_timeout_seconds) do
                          became_idle_notification
                        end
    end
  end

  def user_triggered_event?(event)
    all_touches = event.allTouches
    if all_touches.count > 0
      phase = all_touches.anyObject.phase
      return true if (phase == UITouchPhaseBegan || phase == UITouchPhaseEnded)
    end
  end

end
