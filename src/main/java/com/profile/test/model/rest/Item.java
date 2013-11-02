package com.profile.test.model.rest;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Item {
	private int rank;
	private String link;
	private String keyword;
	private String content;
	private int count;
	private int quotation_cnt;
	private int comment_cnt;
	private int rank_diff;
	private String category;
	
	public Item(){}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getQuotation_cnt() {
		return quotation_cnt;
	}
	public void setQuotation_cnt(int quotation_cnt) {
		this.quotation_cnt = quotation_cnt;
	}
	public int getComment_cnt() {
		return comment_cnt;
	}
	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}
	public int getRank_diff() {
		return rank_diff;
	}
	public void setRank_diff(int rank_diff) {
		this.rank_diff = rank_diff;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}
