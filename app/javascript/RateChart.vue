<script>
  import { Line, mixins } from 'vue-chartjs'
  const { reactiveProp } = mixins

  export default {
    extends: Line,
    mixins: [reactiveProp],
    // https://github.com/apertureless/vue-chartjs/issues/497
    props: [ 'options'],
    mounted () {
      this.renderChart(this.chartData, this.options)
    }
  }
</script>
