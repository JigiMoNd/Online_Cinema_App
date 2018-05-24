package ua.j.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.j.entity.Comment;
import ua.j.repository.CommentRepository;
import ua.j.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentRepository commentRepository;
	
	@Override
	public void saveComment(Comment comment) {
		commentRepository.save(comment);
	}

	@Override
	public List<Comment> findAllComment() {
		return commentRepository.findAll();
	}

	@Override
	public Comment findCommentById(int id) {
		return commentRepository.getOne(id);
	}

	@Override
	public void deleteCommentById(int id) {
		commentRepository.deleteById(id);
	}

}
