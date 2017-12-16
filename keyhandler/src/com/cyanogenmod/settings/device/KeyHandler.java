/*
 * Copyright (C) 2017 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.cyanogenmod.settings.device;

import android.content.Context;
import android.database.ContentObserver;
import android.media.AudioManager;
import android.provider.Settings;
import android.view.KeyEvent;

import com.android.internal.os.DeviceKeyHandler;

public class KeyHandler implements DeviceKeyHandler {
    private static final String TAG = KeyHandler.class.getSimpleName();

    private static final int KEY_ONEKEY_SWITCH = 249;

    private static int lastAction = -1;
    private static int lastRingerMode;
    private static int RINGER_MODE_SILENT = AudioManager.RINGER_MODE_SILENT;

    private final Context mContext;
    private AudioManager mAudioManager;
    private int mRingerMode;
    private ContentResolver mContentResolver;

    public KeyHandler(Context context) {
        mContext = context;
        mAudioManager = (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
        mContentResolver = context.getContentResolver();

    }

    public KeyEvent handleKeyEvent(KeyEvent event) {
        int scanCode = event.getScanCode();
        int action = event.getAction();
        int currentRingerMode = Settings.Global.getInt(mContentResolver,
                                Settings.Global.MODE_RINGER, AudioManager.RINGER_MODE_NORMAL);


        if (scanCode == KEY_ONEKEY_SWITCH && action != lastAction) {
            if (action == KeyEvent.ACTION_DOWN) {
                // Switch turned on
                if (lastRingerMode != RINGER_MODE_SILENT) {
                    lastRingerMode = currentRingerMode;
                    mAudioManager.setRingerMode(RINGER_MODE_SILENT);
                }
            } else if (action == KeyEvent.ACTION_UP) {
                // Switch turned off
                if (currentRingerMode == RINGER_MODE_SILENT) {
                    mAudioManager.setRingerMode(lastRingerMode);
                }
            }

            lastAction = action;

            return null;
        }

        return event;
    }
}
