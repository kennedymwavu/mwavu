(function() {
  "use strict";

  /**
   * Lightweight toast notification system.
   * API mirrors the server-side store/toastr.R calls:
   *   window.toast.success(msg, title)
   *   window.toast.error(msg, title)
   *   window.toast.info(msg, title)
   *   window.toast.warning(msg, title)
   */

  var container = null;

  function getContainer() {
    if (!container) {
      container = document.createElement('div');
      container.id = 'toast-container';
      document.body.appendChild(container);
    }
    return container;
  }

  function show(type, msg, title) {
    var c = getContainer();
    var toast = document.createElement('div');
    toast.className = 'toast toast-' + type;

    var inner = '';
    if (title) {
      inner += '<div class="toast-title">' + title + '</div>';
    }
    if (msg) {
      inner += '<div class="toast-msg">' + msg + '</div>';
    }
    inner += '<button class="toast-close" aria-label="Close">&times;</button>';
    inner += '<div class="toast-progress"></div>';

    toast.innerHTML = inner;
    c.appendChild(toast);

    // trigger CSS enter transition
    requestAnimationFrame(function() {
      requestAnimationFrame(function() {
        toast.classList.add('toast-show');
      });
    });

    var closeBtn = toast.querySelector('.toast-close');
    closeBtn.addEventListener('click', function() { dismiss(toast); });

    // auto-dismiss after 6s (0 = stay, matching previous toastr timeOut:"0" — but
    // for a better UX we use 6s; set to 0 to keep indefinite)
    var timeout = 6000;
    if (timeout > 0) {
      setTimeout(function() { dismiss(toast); }, timeout);
    }
  }

  function dismiss(toast) {
    toast.classList.remove('toast-show');
    toast.addEventListener('transitionend', function() {
      if (toast.parentNode) toast.parentNode.removeChild(toast);
    }, { once: true });
  }

  window.toast = {
    success: function(msg, title) { show('success', msg, title); },
    error:   function(msg, title) { show('error',   msg, title); },
    info:    function(msg, title) { show('info',    msg, title); },
    warning: function(msg, title) { show('warning', msg, title); }
  };

})();
