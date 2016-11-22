hyper = { "cmd", "alt", "shift" }
k = hs.hotkey.modal.new({}, 'F18')
hyperBindings = {'q','w','e','r','t','y','u','i','o','p','a','s','d','f','g','h','j','k','l','z','x','c','v','b','n','m','SPACE'}
for i,key in ipairs(hyperBindings) do
  k:bind({}, key, nil, function() hs.eventtap.keyStroke(hyper, key)
    k.triggered = true
  end)
end
-- Enter Hyper Mode when F19 is pressed
pressedF19 = function()
  k.triggered = false
  k:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF19 = function()
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Single keybinding for app launch
singleapps = {
  {'t', 'Google Chrome'},
  {'p', 'Dash'},
  {'y', 'Finder'},
  {'m', 'Mail'},
  {'c', 'OmniFocus'},
  {'r', 'Evernote'},
  {'n', 'iTerm'}
}

launch = function(appname)
  hs.application.launchOrFocus(appname)
  k.triggered = true
end

for i, app in ipairs(singleapps) do
  k:bind({}, app[1], function() launch(app[2]); k:exit(); end)
end

-- Bind the Hyper key
f19 = hs.hotkey.bind({}, 'F19', pressedF19, releasedF19)
