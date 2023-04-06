<template>
	<view class="page_exam" id="exam_list">

		<template v-if="$check_exam('/exam/list','answers')">
			<!-- 文章列表模块(开始) -->
			<mm_warp class="warp_exam">
				<mm_container class="container">
					<mm_row>
						<mm_col>
							<mm_view class="">
								<!-- 搜索栏 -->
								<uni-search-bar placeholder="搜索名称" @confirm="search" @cancel="cancel" cancelText="取消"
												@input="input($event, 'name')">
									<uni-icons slot="searchIcon" color="#999999" size="18" type="home" />
								</uni-search-bar>
							</mm_view>
						</mm_col>
					</mm_row>
					<mm_row>
						<mm_col>
							<mm_view style="padding-top: 0.5rem;">
								<view class="exam_table_block">
									<uni-table stripe border emptyText="暂无更多数据">
										<uni-tr>
											<uni-th align="center" class="uni-th">名称</uni-th>
											<uni-th align="center" class="uni-th">答题时长</uni-th>
											<uni-th align="center" class="uni-th">总分</uni-th>
											<uni-th align="center" class="uni-th">操作</uni-th>
										</uni-tr>
										<uni-tr v-for="(o, i) in list" :key="i">
											<uni-td align="center">
												{{ o.name }}
											</uni-td>
											<uni-td class="hits" align="center">
												{{ o.duration }}
											</uni-td>
											<uni-td align="center">{{ o.score }}</uni-td>
											<uni-td align="center">
												<router-link :to="'/pages/exam/details?exam_id='+o.exam_id" class="answer_link"  v-if="answered_list[o.exam_id]">
													<span>查看分数</span>
												</router-link>
												<router-link :to="'/pages/exam/details?exam_id='+o.exam_id" class="answer_link"  v-else-if="o.status==='启用'">
													<span>答题</span>
												</router-link>
											</uni-td>
										</uni-tr>
									</uni-table>
								</view>
							</mm_view>
						</mm_col>
					</mm_row>
				</mm_container>
			</mm_warp>
			<!-- 文章列表模块(结束) -->
			<!-- 换页器模块(开始) -->
			<mm_warp>
				<mm_container class="container">
					<mm_row>
						<mm_col>
							<mm_view class="pager_view">
								<!-- 分页器 -->
								<uni-pagination class="pager" show-icon="true" :total="count" :pageSize="query.size"
									:current="query.page" @change="page_change"></uni-pagination>
								<!-- /分页器 -->
							</mm_view>
						</mm_col>
					</mm_row>
				</mm_container>
			</mm_warp>
			<!-- 换页器模块(结束) -->
		</template>
	</view>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		components: {
		},
		data() {
			return {
				// 获取数据地址
				url_get_list: "~/api/exam/get_list?like=0",
				url_del: "~/api/exam/del?",

				// 字段ID
				field:"exam_id",

				// 查询
				query: {
					size: 10,
					page: 1,
					name: ""
				},

				// 数据
				list: [],
				answered_list:[]
			}
		},
		methods: {
			get_list_after(){
				for (let i=0;i<this.list.length;i++){
					this.get_user_answer_state(this.list[i].exam_id);
				}
			},
			get_user_answer_state(exam_id) {
				let _this = this
				this.$get("~/api/user_answer/get_obj?user_id="+this.$store.state.user.user_id+"&exam_id="+exam_id).then((res)=>{
					console.log(res)
					if(res.result && res.result.obj != null){
						_this.$set(_this.answered_list,exam_id,true)
					}else {
						_this.$set(_this.answered_list,exam_id,false)
					}
				})
			},
			input(e, key) {
				this.query[key] = e.value;
			},
			search() {
				this.query.page = 1;
				this.get_list();
			},
			cancel() {
				this.query.name = "";
				this.search();
			},
		},
		mounted() {
		}
	}
</script>

<style>
	#exam_list .pager {
		margin-top: 1rem;
	}
	#exam_list .warp_exam{
		background-color:#fff;
	}
	.answer_link {
		font-size: 0.875rem;
		overflow: hidden;
		margin-right: 5px;
		color: blue !important;
	}
	.uni-th{
		background: darkgrey;
	}
</style>
