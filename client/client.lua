local isRecording = false

local function startRecording()
    if not isRecording then
        StartRecording(1)
        isRecording = true
        lib.notify({ title = 'Recording', description = 'Recording started!', type = 'success' })
    else
        lib.notify({ title = 'Already Recording', description = 'Recording is already in progress.', type = 'info' })
    end
end

local function stopAndSaveRecording()
    if isRecording then
        StopRecordingAndSaveClip()
        isRecording = false
        lib.notify({ title = 'Recording', description = 'Recording saved!', type = 'success' })
    else
        lib.notify({ title = 'Not Recording', description = 'No recording is currently in progress.', type = 'error' })
    end
end

local function stopAndDiscardRecording()
    if isRecording then
        StopRecordingAndDiscardClip()
        isRecording = false
        lib.notify({ title = 'Recording', description = 'Recording discarded!', type = 'warning' })
    else
        lib.notify({ title = 'Not Recording', description = 'No recording is currently in progress.', type = 'error' })
    end
end

local function openRockstarEditor()
    ActivateRockstarEditor()
    lib.notify({ title = 'Editor', description = 'Opening Rockstar Editor...', type = 'info' })
end

local function openRecordMenu()
    lib.registerContext({
        id = 'recording_menu',
        title = 'Rockstar Editor Recording',
        options = {
            {
                title = 'Start Recording',
                description = 'Start recording with Rockstar Editor',
                icon = 'video',
                onSelect = startRecording,
                disabled = isRecording
            },
            {
                title = 'Stop and Save',
                description = 'Stop recording and save the clip',
                icon = 'save',
                onSelect = stopAndSaveRecording,
                disabled = not isRecording
            },
            {
                title = 'Stop and Discard',
                description = 'Stop recording and discard the clip',
                icon = 'trash',
                onSelect = stopAndDiscardRecording,
                disabled = not isRecording
            },
            {
                title = 'Open Rockstar Editor',
                description = 'Open Rockstar Editor (Story Mode only)',
                icon = 'film',
                onSelect = openRockstarEditor
            }
        }
    })
    lib.showContext('recording_menu')
end

RegisterCommand('recordmenu', openRecordMenu)
RegisterKeyMapping('recordmenu', 'Open Recording Menu', 'keyboard', 'F9')

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() and isRecording then
        StopRecordingAndDiscardClip()
        isRecording = false
    end
end)
