package com.azeredudu.entreprise.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2015-07-21T12:37:44.059+0800")
@StaticMetamodel(Item.class)
public class Item_ {
	public static volatile SingularAttribute<Item, Integer> id;
	public static volatile SingularAttribute<Item, String> title;
	public static volatile SingularAttribute<Item, String> description;
	public static volatile SingularAttribute<Item, Date> publishedDate;
	public static volatile SingularAttribute<Item, String> link;
}
