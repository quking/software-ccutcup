package com.pojo;

/**
 * Created by songyexiang on 2017/5/26.
 */
public class PageObject <O> {

        //每个界面的记录总条数
        private int number;
        //当前页
        private int page;
        //总的页数
        private int pages;
        //总的记录条数
        private int count;
        private O obj;

        private void init(){
            this.number = 10;
            this.page = 1;
            this.pages = 1;
            this.count = 0;
        }

        public PageObject(){
            init();
        }

        public PageObject(int number){
            init();
            this.number = ((number>0) ?number:this.number);
        }

        public int getNumber() {
            return number;
        }

        public void setNumber(int number) {
            this.number = number;
        }

        public int getPage() {
            return page;
        }

        public void setPage(int page) {
            this.page = page;
        }

        public int getPages() {
            return pages;
        }

        public void setPages(int pages) {
            this.pages = pages;
        }

        public int getCount() {
            return count;
        }

        public void setCount(int count) {
            this.count = count;
        }

        public O getObj() {
            return obj;
        }

        public void setObj(O obj) {
            this.obj = obj;
        }

    }
