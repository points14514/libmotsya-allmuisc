#ifndef COBOL_MOTSYS_MUISC_H
#define COBOL_MOTSYS_MUISC_H

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief Set the path to the audio file
 * @param audio_path Full path to the audio file (MP3/WAV/etc.)
 * @param return_code 0 = Success, 1 = Invalid empty path
 */
void COBOL_MOTSYS_SET_AUDIO_PATH(char *audio_path, short *return_code);

/**
 * @brief Start playback of the audio file (path must be set first)
 * @param return_code 0 = Success, 1 = Path not set, 2 = Playback failed
 */
void COBOL_MOTSYS_PLAY_AUDIO(short *return_code);

/**
 * @brief Set the audio volume level
 * @param volume_level Volume level (0 = Mute, 100 = Maximum)
 * @param return_code 0 = Success, 3 = Invalid volume (out of 0-100 range)
 */
void COBOL_MOTSYS_SET_VOLUME(short volume_level, short *return_code);

#ifdef __cplusplus
}
#endif

#endif // COBOL_MOTSYS_MUISC_H
