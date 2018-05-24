package ua.j.service;

import java.util.List;

import ua.j.entity.Comment;

public interface CommentService {

	void saveComment(Comment comment);
	
	List<Comment> findAllComment();
	
	Comment findCommentById(int id);
	
	void deleteCommentById (int id);
}
