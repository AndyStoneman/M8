in_thread(name: :main_chords) do
  use_synth :dark_ambience
  define :chord_player do |root , mM, inversion|
    play (chord_invert (chord root, mM), inversion), amp: 1, release: 9, attack: 1
  end
  
  live_loop :main_chords do
    amount = 8
    chord_player :f, :major, 0
    sleep amount
    chord_player :f, :major7, 0
    sleep amount
    chord_player :d, :minor, 1
    sleep amount
    chord_player :d, :major, 1
    sleep amount
    chord_player :g, :minor, 1
    sleep amount
    chord_player :c, :major, 2
    sleep amount
    chord_player :f5, :major, 0
    sleep amount
  end
end

live_loop :piano do
  use_synth :piano
  with_fx :reverb, pre_mix: 0.5, mix: 1 do
    with_fx :echo, mix: 0.2  do
      play_pattern_timed chord(:f5, :major7), 2, release: 8
    end
  end
  sleep 8
end

in_thread(name: :bassline) do
  live_loop :bassline do
    use_synth :fm
    amount = 8
    play :f2, sustain: 2, release: 4
    sleep amount
    play :f2, sustain: 2, release: 4
    sleep amount
    play :d2, sustain: 2, release: 4
    sleep amount
    play :d2, sustain: 2, release: 4
    sleep amount
    play :g2, sustain: 2, release: 4
    sleep amount
    play :c2, sustain: 2, release: 4
    sleep amount
    play :f2, sustain: 2, release: 4
    sleep amount
  end
end


