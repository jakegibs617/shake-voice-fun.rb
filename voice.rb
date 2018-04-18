
#!/bin/env/ruby

@script = <<THE_END
RODERIGO: ,"Tush! never tell me; I take it much unkindly That thou, Iago, who hast had my purse As if the strings were thine, shouldst know of this."
IAGO: ,"'Sblood, but you will not hear me:If ever I did dream of such a matter, Abhor me."
RODERIGO: ,Thou told'st me thou didst hold him in thy hate.
IAGO: ,"Despise me, if I do not."
IAGO: ,"Three great ones of the city, In personal suit to make me his lieutenant, Off-capp'd to him: and, by the faith of man, I know my price, I am worth no worse a place: But he; as loving his own pride and purposes, Evades them, with a bombast circumstance Horribly stuff'd with epithets of war; And, in conclusion, Nonsuits my mediators; for, 'Certes,' says he, 'I have already chose my officer.'"
IAGO: ,And what was he?
IAGO: ,"Forsooth, a great arithmetician, One Michael Cassio, a Florentine, A fellow almost damn'd in a fair wife; That never set a squadron in the field, Nor the division of a battle knows More than a spinster; unless the bookish theoric, Wherein the toged consuls can propose As masterly as he: mere prattle, without practise, Is all his soldiership."
IAGO: ,"But he, sir, had the election: And I, of whom his eyes had seen the proof At Rhodes, at Cyprus and on other grounds Christian and heathen, must be be-lee'd and calm'd By debitor and creditor: this counter-caster, He, in good time, must his lieutenant be, And I--God bless the mark!--his Moorship's ancient."
RODERIGO: ,"By heaven, I rather would have been his hangman."
IAGO: ,"Why, there's no remedy; 'tis the curse of service, Preferment goes by letter and affection, And not by old gradation, where each second Stood heir to the first."
IAGO: ,"Now, sir, be judge yourself, Whether I in any just term am affined To love the Moor."
RODERIGO: ,I would not follow him then.

THE_END


@characters = {
  'Veronica Corningstone' => 'samantha',
  'IAGO' => 'alex',
  'RODERIGO' => 'fred',
  'Hansel' => 'victoria'
}

# Apple TTS voices
# @voices = %W[tom ava oliver daniel tom alex ava lee victoria emily kate serena]
@voices = %W[ alex victoria samantha fred ]

@rate = 175

@script.each_line do |line|
  line.chomp!
  actor, dialog = line.split(':')
  next if actor.nil?

  puts "#{actor} says \"#{dialog}\""
  voice = nil
  unless @characters.has_key?(actor) then
    @characters[actor] = @voices.shift
    @voices.push(@characters[actor])
  end
  voice = @characters[actor]
  system('say', '-r', @rate.to_s, '-v', voice.to_s, dialog)
end
