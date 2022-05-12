package com.april.unomas.persistence;

import java.util.List;

import com.april.unomas.domain.WishVO;

public interface WishDAO {

	public List<WishVO> list() throws Exception;
}
