trigger harsha on Contact (after insert,after update,before insert,before update) {
harsha.test((list<contact>)trigger.new);
}