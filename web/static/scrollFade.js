(function ($) {
    $.fn.scrollFade = function (opts) {
        var defaults = {
            triggerElement: $(this),
            duration: 0.5,
            useDelay: !1,
            delayIncrement: 0.5,
            visibleDistance: 30,
            mediaQuery: 0
        };
        var options = $.extend({}, defaults, opts);
        var duration = options.duration;
        var useDelay = options.useDelay;
        var delayIncrement = options.delayIncrement;
        var visibleDistance = (options.visibleDistance / 100) * $(window).outerHeight();
        var mediaQuery = options.mediaQuery;
        var triggerElement = options.triggerElement;
        var $items = $(this);
        var $previousParent;
        var delay = 0;
        var totalItems = $items.length;
        var itemCount = 0;
        if (window.matchMedia('(min-width:' + mediaQuery + 'px)').matches) {
            $items.css('transition', 'none').css({'opacity': 0, 'transform': 'scale(1.07, 1.07)'});
            $items.each(function () {
                var $item = $(this);
                var $itemParent = $item.closest(triggerElement);
                var itemParentOffsetTop = $itemParent.offset().top + visibleDistance;
                var totalTime = 0;
                $item.css('transition', 'opacity ' + duration + 's ease-in-out, transform ' + duration + 's ease-in-out');
                if (typeof $previousParent === "undefined") {
                    $previousParent = $itemParent
                }
                if ($previousParent.get(0) !== $itemParent.get(0)) {
                    delay = 0
                }
                $item.css('transition-delay', delay + 's');
                totalTime = ((delay + duration) * 1000) + 1000;
                if (useDelay) {
                    delay = delay + delayIncrement
                }
                $previousParent = $itemParent;
                var scrollHandler = function () {
                    var isComplete = $item.hasClass('animation_complete');
                    var inViewport = $(window).scrollTop() + $(window).outerHeight() > itemParentOffsetTop;
                    var atPageBottom = $(window).scrollTop() >= ($(document).innerHeight() - $(window).innerHeight() - 50);
                    if (!isComplete && (inViewport || atPageBottom)) {
                        $item.css({
                            'opacity': 1,
                            'top': '0',
                            'transform': 'scale(1, 1)'
                        }).addClass('animation_complete');
                        itemCount = itemCount + 1;
                        setTimeout(function () {
                            $item.css({'opacity': '', 'top': '', 'transform': '', 'transition': ''})
                        }, totalTime)
                    }
                    if (itemCount >= totalItems) {
                        $(window).off('scroll load', scrollHandler)
                    }
                };
                $(window).on('scroll load', scrollHandler)
            });
            return $items
        }
    }
}(jQuery))