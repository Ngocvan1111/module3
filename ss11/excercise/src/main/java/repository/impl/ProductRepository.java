package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1,"Bim bim",1000));
        productList.add(new Product(2,"Bim bim 2",2000));
        productList.add(new Product(3,"Bim bim 3",3000));
        productList.add(new Product(4,"Bim bim 4",4000));
        productList.add(new Product(5,"Bim bim 5",5000));
    }


    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public void update(int id, Product product) {
        productList.set(id, product);
    }

    @Override
    public void remove(int id) {
        productList.remove(id);

    }
}
