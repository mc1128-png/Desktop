<template>
  <view class="page_word_classification diy_table" id="word_classification_table">
    <!-- 筛选模块(开始) -->
    <mm_warp>
      <mm_container class="container">
        <mm_row>
          <mm_col>
            <mm_view class="">
              <!-- 搜索栏 -->
              <uni-forms :modelValue="query">
                <uni-forms-item label="单词类别" name="word_category">
                  <uni-easyinput type="text" v-model="query.word_category" placeholder="单词类别" />
                </uni-forms-item>
              </uni-forms>
              <!-- /搜索栏 -->
              <view class="table_padding_bottom">
                <button class="btn_right" size="mini" @click="reset()" style="margin-left: 10px;margin-right: 15px">重置</button>
                <button class="btn_right" size="mini" type="primary" @click="search()">查询</button>
                <div class="clear"></div>
              </view>
            </mm_view>
          </mm_col>
        </mm_row>
      </mm_container>
    </mm_warp>

    <mm_warp>
      <mm_container class="container">
        <mm_row>
          <mm_col>
            <view class="table_padding_top">
              <navigator class="nav_left" url="/pages/word_classification/view?" v-show="user_group == '管理员' || $check_action('/word_classification/table','add') || $check_action('/word_classification/view','add')">添加</navigator>
              <button class="btn_left" size="mini" @click="delInfo()" v-show="user_group == '管理员' || $check_action('/word_classification/table','del') || $check_action('/word_classification/view','del')" style="margin-left: 10px;margin-right: 15px">删除</button>
              <div class="clear"></div>
            </view>
            <view class="table_margin_top">
              <uni-table type="selection" @selection-change="selectionChange" stripe border emptyText="暂无更多数据">
                <uni-tr>
                  <uni-th v-if="user_group == '管理员' || $check_field('get','word_category')" align="center">
                    <span>单词类别</span>
                  </uni-th>
                  <uni-th align="center">
                    <span>创建时间</span>
                  </uni-th>
                  <uni-th align="center">
                    <span>更新时间</span>
                  </uni-th>
                  <uni-th align="center">
                    <span>操作</span>
                  </uni-th>
                </uni-tr>
                <uni-tr v-for="(o, i) in list" :key="i">
                  <uni-td class="diy_field diy_text" v-if="user_group == '管理员' || $check_field('get','word_category')" align="center">
                    <span>{{ o["word_category"] }}</span>
                  </uni-td>
                  <uni-td class="diy_field diy_time" align="center">
                    <span>{{ $toTime(o["create_time"],"yyyy-MM-dd hh:mm:ss") }}</span>
                  </uni-td>
                  <uni-td class="diy_field diy_time" align="center">
                    <span>{{ $toTime(o["update_time"],"yyyy-MM-dd hh:mm:ss") }}</span>
                  </uni-td>
                  <uni-td align="center">
                    <navigator class="nav"
                                :url="'/pages/word_classification/view?' + field + '=' + o[field]"
                               v-show="user_group == '管理员' || $check_action('/word_classification/table','set') || $check_action('/word_classification/view','set') || $check_action('/word_classification/view','get')">编辑</navigator>
                  </uni-td>
                </uni-tr>
              </uni-table>
            </view>
          </mm_col>
        </mm_row>
      </mm_container>
    </mm_warp>

    <!-- 分页器模块(开始) -->
    <mm_warp>
      <mm_container class="container">
        <mm_row>
          <mm_col>
            <mm_view class="">
              <!-- 分页器 -->
              <uni-pagination class="pager" show-icon="true" :total="count" :pageSize="query.size"
                              :current="query.page" @change="page_change"></uni-pagination>
              <!-- /分页器 -->
            </mm_view>
          </mm_col>
        </mm_row>
      </mm_container>
    </mm_warp>
    <!-- 分页器模块(结束) -->

  </view>
</template>
<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				// 获取数据地址
				url_get_list: "~/api/word_classification/get_list?like=0",
				url_del: "~/api/word_classification/del?",

				// 字段ID
				field: "word_classification_id",

				// 查询
				query: {
					"size": 7,
					"page": 1,
                    "word_category": "",
					"login_time": "",
					"create_time": "",
				},

				// 数据
				list: [],
			}
		},
		methods: {
          search() {
            this.query.page = 1;
            this.get_list();
          },
          /**
           * 重置
           */
          reset: function reset() {
            uni.clear(this.query);
            uni.push(this.query, this.config);
            this.get_list();
          },
		},
		created() {
		}
	}
</script>

<style scoped type="text/css">
  .pay_model{
    width:100%;
    height: 100%;
    background:rgba(0,0,0,.3);
    position: fixed;
    top:0;
    left:0;
    z-index:90;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
  }
  .pay_model .mask{
    width:100%;
    height: 100%;
    position: absolute;
    top:0;
    left:0;
    z-index:1;
  }
  .pay_model .pay_model_inn{
    background:#fff;
    box-shadow: 0 0.25rem 0.5rem 0 #ddd;
    width:80%;
    padding:20rpx;
    position: relative;
    z-index:10;
    border-radius: 10rpx;
  }
  .pay_model .pay_model_inn .pay_tab{
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
  }
  .pay_model .pay_model_inn .pay_tab_one{
    width:29.3%;
    padding:10px 2%;
    text-align: center;
    border-bottom:2px solid #fff;
  }
  .pay_model .pay_model_inn .pay_tab_one_act{
    border-bottom:2px solid #0000FF;
    color:#0000FF;
  }

  .pay_model .inclued_pay_image{
    width:100%;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    margin:20px 0;
  }
  .pay_model .inclued_pay_image .pay_image{
    width:80%;
    border-radius: 10rpx;

  }
  .clear {
    margin: 0;
    padding: 0;
    left: 0;
    right: 0;
    clear: both;
  }

  .btn_right{
    float: right;
  }

  .btn_left{
    float: left;
  }

  .nav_left{
    float: left;
    display: inline-block;
    line-height: 2.3;
    font-size: 13px;
    padding: 0 1.34em;
    color: #fff;
    background-color: #007aff;
    box-sizing: border-box;
    border-radius: 5px;
  }

  .table_padding_top{
    padding-top: 10px;
  }

  .table_margin_top{
    margin-top: 10px;
  }

  .table_padding_bottom{
    padding-bottom: 10px;
  }

  .nav{
    display: inline-block;
    line-height: 2.3;
    font-size: 13px;
    padding: 0 1.34em;
    color: #fff;
    background-color: #007aff;
    box-sizing: border-box;
    border-radius: 5px;
  }
  .uni-forms--top {
    padding: 0px 15px;
  // padding-top: 22px;
  }

  .uni-forms-item[data-v-39373d84] {
    margin-bottom: 10px;
  }
  .query_select{
    border-color: rgb(229, 229, 229);
    background-color: rgb(255, 255, 255);
    border-radius: 4px;
    box-sizing: border-box;
    flex: 1;
    width: 100%;
    line-height: 2;
    font-size: 14px;
    height: 2.4em;
    min-height: 2.4em;
    display: block;
    outline:none;
  }

  .query_option{
    width: 100%;
  }
</style>
