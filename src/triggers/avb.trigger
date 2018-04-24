trigger avb on Account (before insert,before update,after insert,after update) {
System.debug('Hello ');
}