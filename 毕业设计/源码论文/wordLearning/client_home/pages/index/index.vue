<template>
	<view class="page_index" id="page_index">
		<!-- 广告模块(开始) -->
		<mm_warp class="warp_ad_list" >
			<mm_container class="container">
				<mm_row>
					<mm_col>
						<mm_view>
							<!-- 页头 -->
							<!-- <list_ad :list="list_ad" location="店招"></list_ad> -->
							<!--/ 页头 -->
						</mm_view>
					</mm_col>
				</mm_row>
			</mm_container>
		</mm_warp>
		<!-- 广告模块(结束) -->

		<!-- 轮播图模块(开始) -->
		<mm_warp id="warp_swiper_img" class="warp_swiper_img">
			<mm_container class="container">
				<mm_row>
					<mm_col>
						<mm_view class="view_swiper">
							<!-- 轮播图 -->
							<swiper_img :list="list_slide"></swiper_img>
							<!-- /轮播图 -->
						</mm_view>
					</mm_col>
				</mm_row>
			</mm_container>
		</mm_warp>
		<!-- 轮播图模块(结束) -->

		<!-- 菜单模块(开始) -->
		<mm_warp class="warp_menu_list">
			<mm_container class="container">
				<mm_row>
					<mm_col>
						<mm_view class="view_menu">
							<!-- 菜单 -->
							 <list_menu :list_menu="list_menu"></list_menu>
							<!-- /菜单 -->
						</mm_view>
					</mm_col>
				</mm_row>
			</mm_container>
		</mm_warp>
		<!-- 菜单模块(结束) -->
		<!-- 公告模块(开始) -->
		<mm_warp id="warp_swiper_notice" class="warp_swiper_notice" >
			<mm_container class="container">
				<mm_row>
					<mm_col>
						<mm_view class="view_notice">
							<!-- 公告 -->
							<navigator url="/pages/notice/list">
								<swiper_notice :list="list_notice"></swiper_notice>
							</navigator>
							<!-- /公告 -->
						</mm_view>
					</mm_col>
				</mm_row>
			</mm_container>
		</mm_warp>
		<!-- 公告模块(结束) -->

		<!-- 广告模块(开始) -->
		<mm_warp id="warp_ad_list" class="warp_ad_list" >
			<mm_container class="container">
				<mm_row>
					<mm_col>
						<mm_view>
							<!-- 顶部 -->
							<view style="margin-bottom: 1rem;">
								<list_ad :list="list_ad" location="顶部广告"></list_ad>
							</view>
							<!-- /顶部 -->
						</mm_view>
					</mm_col>
				</mm_row>
			</mm_container>
		</mm_warp>
		<!-- 广告模块(结束) -->
		<!--学习技巧模块(开始) -->
		<mm_warp id="warp_article_list" class="warp_article_list" >
			<mm_container class="container">
				<mm_row>
					<mm_col>
						<mm_view style="padding: 0.5rem;padding-bottom: 0.125rem;">
							<!--学习技巧标题 -->
							<bar_title title="学习技巧" url="/pages/article/list"></bar_title>
							<!-- /学习技巧标题 -->
						</mm_view>
					</mm_col>
					<mm_col>
						<mm_view>
							<!--学习技巧文章 -->
							<list_article :list="list_article"></list_article>
							<!-- /学习技巧文章 -->
						</mm_view>
					</mm_col>
				</mm_row>
			</mm_container>
		</mm_warp>
		<!--学习技巧模块(结束) -->

		<!-- 广告模块(开始) -->
		<mm_warp id="warp_ad_list_center" class="warp_ad_list" >
			<mm_container class="container">
				<mm_row>
					<mm_col>
						<mm_view>
							<!-- 中部 -->
							<view style="margin-bottom: 1rem;">
								<list_ad :list="list_ad" location="中部广告"></list_ad>
							</view>
							<!-- /中部 -->
						</mm_view>
					</mm_col>
				</mm_row>
			</mm_container>
		</mm_warp>
		<!-- 广告模块(结束) -->

		<!-- 广告模块(开始) -->
		<mm_warp id="warp_ad_list_buttom" class="warp_ad_list" >
			<mm_container class="container">
				<mm_row>
					<mm_col>
						<mm_view>
							<!-- 底部 -->
							<view style="margin-top: 1rem;">
								<list_ad :list="list_ad" location="底部广告"></list_ad>
							</view>
							<!-- /底部 -->
						</mm_view>
					</mm_col>
				</mm_row>
			</mm_container>
		</mm_warp>
		<!-- 广告模块(结束) -->

		<!-- 链接模块(开始) -->
		<mm_warp class="warp_link_list">
			<mm_container class="container">
				<mm_row>
					<mm_col>
						<mm_view>
							<!-- 友情链接 -->
							<list_link :list="list_link"></list_link>
							<!-- /友情链接 -->
						</mm_view>
					</mm_col>
				</mm_row>
			</mm_container>
		</mm_warp>
		<!-- 链接模块(结束) -->

		<!-- 版权模块(开始) -->
		<mm_warp class="warp_copyright">
			<mm_container class="container">
				<mm_row>
					<mm_col>
						<mm_view>
							<!-- 版权信息 -->
							<view class="copyright"><text>@版权归属 XX 所有</text></view>
							<!-- /版权信息 -->
						</mm_view>
					</mm_col>
				</mm_row>
			</mm_container>
		</mm_warp>
		<!-- 版权模块(结束) -->

	</view>
</template>

<script>
	import bar_title from "@/components/diy/bar_title.vue";
	import list_menu from "@/components/diy/list_menu.vue";
	import list_ad from "@/components/diy/list_ad.vue";
	import list_article from "@/components/diy/list_article.vue";
	import list_link from "@/components/diy/list_link.vue";
	import swiper_notice from "@/components/diy/swiper_notice.vue";
	import swiper_img from "@/components/diy/swiper_img.vue";

	import mixin from "@/mixins/page.js";
	export default {
		mixins: [mixin],
		components: {
			bar_title,
			list_ad,
			list_menu,
			list_article,
			list_link,
			swiper_img,
			swiper_notice
		},
		data() {
			return {
				isSmall: false,
				sendValue: "",
				chatList:[],
				showChat: false,
				isAdmin: false,
				token:"",
				scrollTop: 0,
				oldScrollTop: 0,


				str: "<div>测试一下</div>",
				list_ad: [],
				list_slide: [],
				list_article: [],
				list_menu: [],
				list_link: [],
				list_notice: []
			}
		},
		methods: {
					// toggle
			toToggle(){
				this.isAdmin = !this.isAdmin;
			},

			/**
			 * 当前年月日时分秒方法
			 * @param {Object} fmt
			 */
			dateFormat(fmt) {
				var myDate = new Date();
				var o = {
					"M+": myDate.getMonth() + 1, // 月份
					"d+": myDate.getDate(), // 日
					"h+": myDate.getHours(), // 小时
					"m+": myDate.getMinutes(), // 分
					"s+": myDate.getSeconds(), // 秒
					"q+": Math.floor((myDate.getMonth() + 3) / 3), // 季度
					"S": myDate.getMilliseconds() // 毫秒
				};
				if (/(y+)/.test(fmt))
					fmt = fmt.replace(RegExp.$1, (myDate.getFullYear() + "").substr(4 - RegExp.$1.length));
				for (var k in o)
					if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
						return fmt;
			},

			/**
			 *  获取轮播图
			 */
			get_slides() {
				this.$get("~/api/slides/get_list?", {}, (json) => {
					if (json.result && json.result.list) {
                        console.log("轮播图" ,json.result.list);
						this.list_slide = json.result.list;
						this.list_slide.map((o)=>{
							o["praise_len"];
						});
						this.get_praise(this.list_slides ,"slides" ,"slides_id");
					}
				})
			},

			/**
			 *  获取导航栏
			 */
			get_menu() {
				var user_group = this.user_group;
				this.$get("~/api/auth/get_list?", {"size": "0",get: "", user_group,get:1,"position":"top"}, (json) => {
					if (json.result && json.result.list) {
                        console.log("导航栏" ,json.result.list);
						this.list_menu = json.result.list;
						this.list_menu.map((o)=>{
							o["praise_len"];
						});
						this.get_praise(this.list_auth ,"auth" ,"auth_id");
					}
					this.list_menu.unshift({"mod_name":"单词练习","path":"/exam/list"})
				})
			},
			/**
			 *  获取文章
			 */
			get_article() {
				this.$get("~/api/article/get_list?", {"page":1,"size":5}, (json) => {
					if (json.result && json.result.list) {
                        console.log("文章" ,json.result.list);
						this.list_article = json.result.list;
						this.list_article.map((o)=>{
							o["praise_len"];
						});
						this.get_praise(this.list_article ,"article" ,"article_id");
					}
				})
			},

			/**
			 *  获取广告
			 */
			get_ad() {
				this.$get("~/api/ad/get_list?", {"page":1,"size":5}, (json) => {
					if (json.result && json.result.list) {
                        console.log("广告" ,json.result.list);
						this.list_ad = json.result.list;
						this.list_ad.map((o)=>{
							o["praise_len"];
						});
						this.get_praise(this.list_ad ,"ad" ,"ad_id");
					}
				})
			},

			/**
			 *  获取链接列表
			 */
			get_link(){
				this.$get("~/api/link/get_list?", {"page":1,"size":3}, (json) => {
					if (json.result && json.result.list) {
                        console.log("链接",json.result.list);
						this.list_link = json.result.list;
						this.list_link.map((o)=>{
							o["praise_len"];
						});
						this.get_praise(this.list_link ,"link" ,"link_id");
					}
				})
			},

			/**
			 *  获取公告列表
			 */
			get_notice(){
				this.$get("~/api/notice/get_list?", {"page":1,"size":3}, (json) => {
					if (json.result && json.result.list) {
                        console.log("公告" ,json.result.list);
						this.list_notice = json.result.list;
						this.list_notice.map((o)=>{
							o["praise_len"];
						});
						this.get_praise(this.list_notice ,"notice" ,"notice_id");
					}
				})
			},

			/**
			 *  获取点赞数
			 *  @param {Object} list
			 */
			get_praise(list ,table ,idName){
				this.$get("~/api/praise/count_group?source_table=" + table + "&groupby=source_id", {}, (res) => {
					if(res.result){
						res.result.map((o)=>{
							for(let i = 0;i < list.length; i++) {
								let oj = list[i];
								if(oj[idName] === o["source_id"]) {
									oj["praise_len"] = o["count"];
									break;
								}
							}
						});
					}
					else if(res.error) {
						console.error(res.error);
					}
				});
			}
		},
		onLoad() {
			this.get_menu();
			this.get_slides();
			this.get_article();
			this.get_link();
			this.get_notice();
			this.get_ad()

			this.get_praise();
		}
	}
</script>

<style>
.page_index{
	position: relative;
}
.support_entry{
	position: fixed;
	top: 400px;
	right: 0px;
	width: 80px;
	height: 80px;
	cursor: pointer;
	z-index: 99999;
}
  .support_module .container{
    height: 64%;
    width: 19.4rem;
    border-radius: 4px;
    border: 0.5px solid #e0e0e0;
    background-color: #f5f5f5;
    overflow: hidden;
    position: fixed;
    padding: 0;
    margin-left: -9.7rem;
    z-index: 99999999;
    }
	.support_module	.small_css{
		height: 40px;
    width: 200px;
    right: -15px;
    bottom: 0px;
	}
	.support_module	.big_css{
				top: 12%;
				left: 50%;
				}
    .support_module .content{
        width: calc(100% - 0px);
        overflow-y: scroll;
				height: 64%;
				padding: 0 10px 10px 0;
    }
		.support_module .content::-webkit-scrollbar{
	display: none
}
.support_module_title{
	text-align: right;
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid #ccc;

}
.support_module_title .title_btn{
	font-size: 20px;
	cursor: pointer;
	margin-right: 20px;
	color: #888;

}
    .support_module .content:hover::-webkit-scrollbar-thumb{
        background:rgba(0,0,0,0.1);
    }
    .support_module .bubble{
        max-width: 182px;
        padding: 10px;
        border-radius: 5px;
        position: relative;
        color: #000;
        word-wrap:break-word;
        word-break:normal;
				font-size: 12px;
    }
    .support_module .item_left .bubble{
        margin-left: 10px;
        background-color: #fff;
    }
    .support_module .item_left .bubble:before{
        content: "";
        position: absolute;
        width: 0;
        height: 0;
        border-left: 10px solid transparent;
        border-top: 10px solid transparent;
        border-right: 10px solid #fff;
        border-bottom: 10px solid transparent;
        left: -20px;
    }
    .support_module .item_right .bubble{
        margin-right: 10px;
        background-color: #9eea6a;
    }
    .support_module .item_right .bubble:before{
        content: "";
        position: absolute;
        width: 0;
        height: 0;
        border-left: 10px solid #9eea6a;
        border-top: 10px solid transparent;
        border-right: 10px solid transparent;
        border-bottom: 10px solid transparent;
				left: none;

				        right: -20px;
    }
    .support_module .item{
        margin-top: 15px;
        display: flex;
        width: 100%;
    }
    .support_module .item.item_right{
        justify-content: flex-end;
    }
    .support_module .item.item-center{
        justify-content: center;
    }
    .support_module .item.item-center span{
        font-size: 12px;
        padding: 2px 4px;
        color: #fff;
        background-color: #dadada;
        border-radius: 3px;
        -moz-user-select:none; /*火狐*/
        -webkit-user-select:none; /*webkit浏览器*/
        -ms-user-select:none; /*IE10*/
        -khtml-user-select:none; /*早期浏览器*/
        user-select:none;
    }

    .support_module .avatar image{
        width: 42px;
        height: 42px;
        border-radius: 50%;
    }
    .support_module .input-area{
        border-top:0.5px solid #e0e0e0;
        height: 15%;
        background-color: #fff;
    }
    .support_module textarea{
        flex: 1;
        padding: 10px;
        font-size: 12px;
        border: none;
        overflow-y: auto;
        overflow-x: hidden;
        outline:none;
        resize:none;
				width: 102%;
				height: 100%;
				min-height: 100%;
				max-height: 100%;
				box-sizing: border-box;
    }
    .support_module .button-area{
      display: flex;
    height: 50px;
    line-height: 50px;
    padding: 5px;
    justify-content: flex-end;
    text-align: right;
    width: 100%;
		background: #fff;
    }
    .support_module .button-area .send-btn{
           width: 80px;
    height: 28px;
    line-height: 28px;
    border: none;
    outline: none;
    border-radius: 4px;
    float: right;
    cursor: pointer;
    background: #9eea6a;
    font-size: 12px;
    color: #333;
    margin: 0px;
    text-align: center;
    }

    /* 设置滚动条的样式 */
    ::-webkit-scrollbar {
        width:10px;
    }
    /* 滚动槽 */
    ::-webkit-scrollbar-track {
        -webkit-box-shadow:inset006pxrgba(0,0,0,0.3);
        border-radius:8px;
    }
    /* 滚动条滑块 */
    ::-webkit-scrollbar-thumb {
        border-radius:10px;
        background:rgba(0,0,0,0);
        -webkit-box-shadow:inset006pxrgba(0,0,0,0.5);
    }

	@media (min-width:768px) {
		#page_index .view_menu{
			margin: 0 auto;
			width: 75%;
		}
	}
	#page_index .container{

	}
	#page_index .view_menu{
		margin-bottom: 1rem;
	}
	#page_index .mm_container{
		background-color: #FFFFFF;
	}
	#page_index .copyright {
		text-align: center;
		padding: 1rem 0;
		color: #999;
		font-size: 0.875rem;
	}
</style>
